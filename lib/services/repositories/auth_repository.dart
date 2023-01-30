/* import 'dart:convert';
import 'dart:developer';
import 'package:bucc_app/utils/app_urls.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final Provider<AuthRepository> authRepositoryProvider =
    Provider((ref) => AuthRepository());

class AuthRepository {
  //! REGISTER USER
  //! USING FUTURE EITHER -
  FutureEither<UserModel> signUpUser(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    try {
      //! MAKE REQUEST
      http.Request request = http.Request("POST", Uri.parse(AppUrls.signUp));

      //! ADD HEADER SUPPORTS
      request.headers
          .addAll({"Content-Type": "application/json; charset=UTF-8"});

      //! REQUEST BODY
      request.body = jsonEncode({
        "password": password,
        "email": email,
        "firstname": firstName,
        "lastname": lastName
      });

      //! SEND REQUEST
      http.StreamedResponse response = await request.send();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      //! RESPONSE CONVERTED TO MAP, USED TO RUN AUTH TEST CASES AND DECIDE WHAT ACTION TO TAKE AS SEEN BELOW
      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      switch (responseInMap["success"]) {
        //! SERVER REQUEST WAS SUCCESSFUL
        case true:
          log("User Registered Successfully: AuthStatus Code ${response.statusCode} \nPhrase: ${response.reasonPhrase} \nResponse: $responseInMap");

          //! CONVERT DATA TO MODEL
          UserModel registeredUser =
              UserModel.fromJSON(responseInMap["data"]["user"]);

          //! CACHE ACCESS TOKEN
          TokenCache.cacheUserTokens(token: responseInMap["data"]["token"]);

          //! CACHE USER DETAILS
          UserDetailsCache.cacheUserDetails(theUserDetails: registeredUser);

          //! RETURN THE USER MODEL, USING SHORTCUT - RIGHT.
          //! RIGHT IS SHORTCUT OF [Either.of(Your Type Here)]
          return right(registeredUser);

        //! ACCOUNT ALREADY EXISTS
        case false:
          log("Response: $responseStream");
          //! RETURN THE FAILURE, SHOW THE MESSAGE USING SHORTCUT LEFT.
          return left(Failure(responseInMap["errors"]));

        //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
        default:
          log("Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}");

          return left(Failure(responseInMap["errors"]));
      }
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  //!
  //!
  //! SIGN IN USER
  FutureEither<bool> signInUser(
      {required String email, required String password}) async {
    try {
      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request = http.Request("POST", Uri.parse(AppUrls.login))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"})
        ..body = jsonEncode({"password": password, "emailOrUsername": email});

      //! SEND REQUEST
      http.StreamedResponse response = await request.send();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      //! RESPONSE CONVERTED TO MAP, USED TO RUN AUTH TEST CASES AND DECIDE WHAT ACTION TO TAKE AS SEEN BELOW
      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      switch (responseInMap["success"]) {
        //! SERVER REQUEST WAS SUCCESSFUL
        case true:
          await TokenCache.cacheUserTokens(
                  token: responseInMap["data"]["user"]["token"])
              .whenComplete(() => log("User tokens cached"));

          //! DECLARE DATE FOR REQUESTING TRANSACTION HISTORY
          final DateTime theDate = DateTime.now();

          //! CACHE USER TOKEN
          await Future.wait([
            ProfileRepository().getUserInfo(),
            WalletRepository().getWalletBalance(),
            ProfileRepository().fetchFavouritesList(),
            WalletRepository().fetchTotalMonthlyDebitTransactionList(
                year: theDate.year.toString()),
            WalletRepository().getTransactionHistoryByMonth(
                year: theDate.year.toString(),
                month: getMonth(dateTime: theDate))
          ],
                  cleanUp: (successValue) => log(
                      "FUTURE WAIT SUCCESS VALUE: ${successValue.toString()}"))
              .catchError((error) {
            for (var element in error) {
              log(element.toString());
            }
          });

          return right(responseInMap["success"]);

        //! UNAUTHORIZED - WRONG PASSWORD
        case false:
          log("Response: $responseStream");
          //! RETURN THE FAILURE, SHOW THE MESSAGE USING SHORTCUT LEFT.
          return left(Failure(responseInMap["errors"]));

        //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
        default:
          log("Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}");

          return left(Failure(responseInMap["errors"]));
      }
    } catch (error) {
      log("CATCH ERROR ${error.toString()}");
      return left(Failure(error.toString()));
    }
  }

  //!
  //!
  //! CHANGE PASSWORD
  FutureEither<String> changePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      //! FETCH USER TOKEN
      final Iterable<UserToken?> userToken = await TokenCache.getUserTokens();

      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request =
          http.Request("PATCH", Uri.parse(AppUrls.changePassword))
            ..headers.addAll({
              "Content-Type": "application/json; charset=UTF-8",
              "Authorization": "Bearer ${userToken.first?.token}"
            })
            ..body = jsonEncode(
                {"oldPassword": oldPassword, "newPassword": newPassword});

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
      return left(Failure(error.toString()));
    }
  }

  //!
  //!
  //! FORGOT PASSWORD
  FutureEither<String> forgotPassword({required String email}) async {
    try {
      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request = http.Request(
          "POST", Uri.parse(AppUrls.forgotPassword))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"})
        ..body = jsonEncode({"email": email});

      //! SEND REQUEST
      http.StreamedResponse response = await request.send();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      //! RESPONSE CONVERTED TO MAP, USED TO RUN AUTH TEST CASES AND DECIDE WHAT ACTION TO TAKE AS SEEN BELOW
      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      log(responseInMap.toString());

      //! SWITCH AND GET RESPONSE
      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(error.toString()));
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
      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request = http.Request(
          "PATCH", Uri.parse(AppUrls.resetPassword))
        ..headers.addAll({"Content-Type": "application/json; charset=UTF-8"})
        ..body = jsonEncode(
            {"email": email, "newPassword": password, "token": emailedToken});

      //! SEND REQUEST
      http.StreamedResponse response = await request.send();

      //! HOLD RESPONSE
      String responseStream = await response.stream.bytesToString();

      //! RESPONSE CONVERTED TO MAP, USED TO RUN AUTH TEST CASES AND DECIDE WHAT ACTION TO TAKE AS SEEN BELOW
      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      log(responseInMap.toString());

      //! SWITCH AND GET RESPONSE
      return authResponseSwitch(
          response: response,
          responseInMap: responseInMap,
          responseStream: responseStream);
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }

  //! LOGOUT
  Future<bool> logout() async {
    bool isCacheCleared = false;

    //! CLEAR ALL CACHE
    await Future.wait([
      Hive.deleteFromDisk()
          .whenComplete(() => isCacheCleared = true)
          .catchError((error) => log("Logout Error: $error"))
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

        return left(Failure(theErrors));

      //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
      default:
        log("Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}");
        return left(Failure(responseInMap["errors"]));
    }
  }
}
 */