import 'package:bucc_app/services/model/event/event_model.dart';
import 'package:bucc_app/services/repositories/posts_repository.dart';
import 'package:bucc_app/utils/app_functional_utils.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final StateNotifierProvider<PostsController, bool> postsControllerProvider =
    StateNotifierProvider<PostsController, bool>((ref) => PostsController(
        postRepository: ref.watch(postsRepositoryProvider), ref: ref));

class PostsController extends StateNotifier<bool> {
  final PostRepository _postsRepository;
  final Ref _ref;

  //! CONSTRUCTOR
  PostsController({required PostRepository postRepository, required Ref ref})
      : _postsRepository = postRepository,
        _ref = ref,
        super(false);

  //!
  //! FETCH POSTS
  Future<bool> fetchPosts(
      {required BuildContext context, required String filePath}) async {
    state = true;

    Either<Failure, List<EventModel>> response =
        await _postsRepository.fetchPosts().catchError((error) {
      state = false;
      "Error encountered: $error".log();
    });

    state = false;

    response.fold(
        (Failure failure) => AppFunctionalUtils.showBanner(
            context: context,
            theMessage: failure.message,
            theType: NotificationType.failure),
        (List<EventModel> successStatement) {});

    return response.isRight();
  }

  //!
  //! GET USER INFO
  Future<bool> getUserInfo(
      {required BuildContext context, required String postID}) async {
    state = true;

    Either<Failure, EventModel> response = await _postsRepository
        .getPostDetail(postID: postID)
        .catchError((error) {
      state = false;
      "Error encountered: $error".log();
    });

    state = false;

    response.fold(
        (Failure failure) => AppFunctionalUtils.showBanner(
            context: context,
            theMessage: failure.message,
            theType: NotificationType.failure),
        (EventModel successMessage) => "this $successMessage".log());

    return response.isRight();
  }
}
