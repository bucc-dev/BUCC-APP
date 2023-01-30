import 'dart:convert';
import 'package:bucc_app/services/cache/tokens_cache.dart';
import 'package:bucc_app/services/cache/user_details_cache.dart';
import 'package:bucc_app/services/model/auth/token_model.dart';
import 'package:bucc_app/services/model/auth/user_model.dart';
import 'package:bucc_app/utils/app_urls.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final Provider<ProfileRepository> profileRepositoryProvider =
    Provider((ref) => ProfileRepository());

class ProfileRepository {
  //!
  //!
  //! UPLOAD PROFILE PHOTO
  FutureEither<String> uploadProfilePhoto({required String filePath}) async {
    try {
      //! FETCH USER TOKEN
      final UserToken? userToken = await TokenCache.getUserTokens();

      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      var request = http.MultipartRequest("PUT", Uri.parse(""))
        ..headers.addAll({
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${userToken!.token}"
        })
        ..files
            .add(await http.MultipartFile.fromPath("profilePhoto", filePath));

      //! SEND REQUEST
      http.StreamedResponse response = await request.send();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      //! RESPONSE CONVERTED TO MAP, USED TO RUN AUTH TEST CASES AND DECIDE WHAT ACTION TO TAKE AS SEEN BELOW
      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      //! SWITCH AND GET RESPONSE
      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //! GET USER INFO
  FutureEither<String> getUserInfo() async {
    try {
      //! FETCH USER TOKEN
      final UserToken? userToken = await TokenCache.getUserTokens();

      http.Request request =
          http.Request("GET", Uri.parse(AppUrls.fetchUserDetail))
            ..headers.addAll({
              "Content-Type": "application/json; charset=UTF-8",
              "Authorization": "Bearer ${userToken?.token}"
            });

      http.StreamedResponse response = await request.send();

      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      "GET USER INFO ${responseInMap.toString()}".log();

      UserModel userModel = UserModel.fromJSON(responseInMap["data"]["user"]);

      await UserDetailsCache.cacheUserDetails(theUserDetails: userModel)
          .then((value) async => value == true
              ? {
                  //! TODO: UPDATE USER STATE
                }
              : {});

      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //! EDIT USER INFO
  FutureEither<String> editUserInfo({required UserModel editedInfo}) async {
    try {
      //! FETCH USER TOKEN
      final UserToken? userToken = await TokenCache.getUserTokens();

      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request =
          http.Request("GET", Uri.parse(AppUrls.editUserDetail))
            ..headers.addAll({
              "Content-Type": "application/json; charset=UTF-8",
              "Authorization": "Bearer ${userToken?.token}"
            })
            ..body = jsonEncode({editedInfo.toJSON()});

      //! SEND REQUEST
      http.StreamedResponse response = await request.send();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      "GET USER INFO ${responseInMap.toString()}".log();

      UserModel userModel = UserModel.fromJSON(responseInMap["data"]["user"]);

      await UserDetailsCache.cacheUserDetails(theUserDetails: userModel)
          .then((value) async => value == true
              ? {
                  //! TODO: UPDATE USER STATE
                }
              : {});

      //! SWITCH AND GET RESPONSE
      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //! SWITCH FUNCTION
  FutureEither<String> authResponseSwitch(
      {required Map<String, dynamic> responseInMap,
      required http.StreamedResponse response,
      required String responseStream}) async {
    switch (responseInMap["success"]) {
      //! SERVER REQUEST WAS SUCCESSFUL
      case true:
        return right(responseInMap["message"]);

      //! UNAUTHORIZED -  SOMETHING WENT WRONG
      case false:
        //! RETURN THE FAILURE, SHOW THE MESSAGE USING SHORTCUT LEFT.
        String theErrors = "";

        //! CHECK FOR RESPONSE TYPE
        responseInMap["errors"].runtimeType == List
            ? {
                for (var error in responseInMap["errors"])
                  {theErrors += "$error \n"}
              }
            : {theErrors = responseInMap["errors"]};

        return left(Failure(message: theErrors));

      //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
      default:
        "Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}"
            .log();
        return left(Failure(message: responseInMap["errors"]));
    }
  }
}
