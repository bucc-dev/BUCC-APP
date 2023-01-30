import 'dart:convert';
import 'package:bucc_app/services/cache/tokens_cache.dart';
import 'package:bucc_app/services/model/auth/token_model.dart';
import 'package:bucc_app/services/model/event/event_model.dart';
import 'package:bucc_app/utils/app_urls.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

final Provider<PostRepository> profileRepositoryProvider =
    Provider((ref) => PostRepository());

class PostRepository {
  //!
  //!
  //! FETCH POST DETAILS
  FutureEither<EventModel> getPostDetail({required String postID}) async {
    try {
      //! FETCH USER TOKEN
      final UserToken? userToken = await TokenCache.getUserTokens();

      //! MAKE REQUEST, ADD HEADER SUPPORTS, REQUEST BODY AND SEND REQUEST
      http.Request request =
          http.Request("GET", Uri.parse(AppUrls.getPostDetails(postID: postID)))
            ..headers.addAll({
              "Content-Type": "application/json; charset=UTF-8",
              "Authorization": "Bearer ${userToken?.token}"
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
          //! LOG DETAIL
          "GET POST INFO ${responseInMap.toString()}".log();

          //! TODO: CACHE POST DETAILS && IMPLEMENT POSTS SWITCH ON TRUE
          EventModel theEvent = EventModel.fromJSON(responseInMap["event"]);

          //! RETURN VALUE
          return right(theEvent);

        //! UNAUTHORIZED -  SOMETHING WENT WRONG
        case false:
          //! RETURN THE FAILURE, SHOW THE MESSAGE USING SHORTCUT LEFT.
          return left(Failure(message: responseInMap["errors"]));

        //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
        default:
          "Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}"
              .log();
          return left(Failure(message: responseInMap["errors"]));
      }
    } catch (error) {
      return left(Failure(message: error.toString()));
    }
  }

  //! FETCH POSTS
  FutureEither<List<EventModel>> fetchPosts() async {
    try {
      //! FETCH USER TOKEN
      final UserToken? userToken = await TokenCache.getUserTokens();

      http.Request request = http.Request("GET", Uri.parse(AppUrls.fetchPosts))
        ..headers.addAll({
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${userToken?.token}"
        });

      http.StreamedResponse response = await request.send();

      String responseStream = await response.stream.bytesToString();

      Map<String, dynamic> responseInMap = jsonDecode(responseStream);

      switch (responseInMap["success"]) {
        //! SERVER REQUEST WAS SUCCESSFUL
        case true:
          //! TODO: IMPLEMENT POSTS SWITCH ON TRUE

          //! CREATE EMPTY EVENT MODELS LIST
          final List<EventModel> theFavouritesList = [];

          //! RETURN VALUE
          return right(theFavouritesList);

        //! UNAUTHORIZED -  SOMETHING WENT WRONG
        case false:
          //! RETURN THE FAILURE, SHOW THE MESSAGE USING SHORTCUT LEFT.
          return left(Failure(message: responseInMap["errors"]));

        //! SERVER REQUEST FAILED OR ANY OTHER FAILURE TYPE
        default:
          "Error Code: ${response.statusCode} \nResponse: $responseStream, \nReason: ${response.reasonPhrase}"
              .log();
          return left(Failure(message: responseInMap["errors"]));
      }
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
