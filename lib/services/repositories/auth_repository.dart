import 'dart:convert';
import 'package:bucc_app/services/cache/tokens_cache.dart';
import 'package:bucc_app/services/model/auth/token_model.dart';
import 'package:bucc_app/utils/app_urls.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

final Provider<AuthRepository> authRepositoryProvider =
    Provider((ref) => AuthRepository());

class AuthRepository {
  //!
  //!
  //! SIGN IN USER
  FutureEither<bool> signInUser(
      {required String matricOrEmail, required String password}) async {
    try {
      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request = http.Request(
          "POST", Uri.parse(AppUrls.loginWithEmailOrMatric))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"})
        ..body =
            jsonEncode({"password": password, "matric_email": matricOrEmail});

      //! SEND REQUEST
      http.StreamedResponse response = await request.send()
        ..stream.bytesToString();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      //! RESPONSE CONVERTED TO MAP, USED TO RUN AUTH TEST CASES AND DECIDE WHAT ACTION TO TAKE AS SEEN BELOW
      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      switch (responseInMap["success"]) {
        //! SERVER REQUEST WAS SUCCESSFUL
        case true:
          UserToken userToken = UserToken.fromJSON(responseInMap["token"]);
          await TokenCache.cacheUserTokens(userToken: userToken)
              .whenComplete(() => "User tokens cached".log());

          //! CACHE USER TOKEN
          await Future.wait([],
                  cleanUp: (successValue) =>
                      "FUTURE WAIT SUCCESS VALUE: ${successValue.toString()}")
              .catchError((error) {
            for (var element in error) {
              element.toString().log();
            }
          });

          return right(responseInMap["success"]);

        //! UNAUTHORIZED - WRONG PASSWORD
        case false:
          "Response: $responseStream".log();
          //! RETURN THE FAILURE, SHOW THE MESSAGE USING SHORTCUT LEFT.
          return left(Failure(message: responseInMap["errors"]));

        //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
        default:
          "Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}"
              .log();

          return left(Failure(message: responseInMap["errors"]));
      }
    } catch (error) {
      "CATCH ERROR ${error.toString()}".log();
      return left(Failure(message: error.toString()));
    }
  }

  //!
  //!
  //! CHANGE PASSWORD
  FutureEither<String> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      //! FETCH USER TOKEN
      final UserToken? userToken = await TokenCache.getUserTokens();

      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request =
          http.Request("PATCH", Uri.parse(AppUrls.changePassword))
            ..headers.addAll({
              "Content-Type": "application/json; charset=UTF-8",
              "Authorization": "Bearer ${userToken?.token}"
            })
            ..body = jsonEncode(
                {"oldPassword": oldPassword, "newPassword": newPassword});

      http.StreamedResponse response = await request.send();

      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //!
  //!
  //! FORGOT PASSWORD
  FutureEither<String> forgotPassword({required String email}) async {
    try {
      http.Request request = http.Request(
          "POST", Uri.parse(AppUrls.forgotPassword))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"})
        ..body = jsonEncode({"email": email});

      http.StreamedResponse response = await request.send();

      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      responseInMap.toString().log();

      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //!
  //!
  //! RESET PASSWORD
  FutureEither<String> resetPassword(
      {required String email,
      required String password,
      required String emailedToken}) async {
    try {
      http.Request request = http.Request(
          "PATCH", Uri.parse(AppUrls.resetPassword))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"})
        ..body = jsonEncode(
            {"email": email, "newPassword": password, "token": emailedToken});

      http.StreamedResponse response = await request.send();

      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      responseInMap.toString().log();

      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //! LOGOUT
  Future<bool> logout() async {
    bool isCacheCleared = false;

    //! CLEAR ALL CACHE; TODO: CALL BACK END.
    await Future.wait([
      Hive.deleteFromDisk()
          .whenComplete(() => isCacheCleared = true)
          .catchError((error) => "Logout Error: $error".log())
    ]);

    return isCacheCleared;
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
