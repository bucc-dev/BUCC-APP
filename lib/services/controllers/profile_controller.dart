// ignore_for_file: body_might_complete_normally_catch_error
import 'package:bucc_app/services/model/auth/user_model.dart';
import 'package:bucc_app/services/repositories/profile_repository.dart';
import 'package:bucc_app/utils/app_functional_utils.dart';
import 'package:bucc_app/utils/extentions/app_extensions.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final StateNotifierProvider<ProfileController, bool> profileControllerProvider =
    StateNotifierProvider<ProfileController, bool>((ref) => ProfileController(
        profileRepository: ref.watch(profileRepositoryProvider), ref: ref));

class ProfileController extends StateNotifier<bool> {
  final ProfileRepository _profileRepository;

  //! CONSTRUCTOR
  ProfileController(
      {required ProfileRepository profileRepository, required Ref ref})
      : _profileRepository = profileRepository,
        super(false);

  //!
  //! UPLOAD PROFILE PHOTO
  Future<bool> uploadProfilePhoto(
      {required BuildContext context, required String filePath}) async {
    state = true;

    Either<Failure, String> response = await _profileRepository
        .uploadProfilePhoto(filePath: filePath)
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
        (String successStatement) {});

    return response.isRight();
  }

  //!
  //! GET USER INFO
  Future<bool> getUserInfo({required BuildContext context}) async {
    state = true;

    Either<Failure, String> response =
        await _profileRepository.getUserInfo().catchError((error) {
      state = false;
      "Error encountered: $error".log();
    });

    state = false;

    response.fold(
        (Failure failure) => AppFunctionalUtils.showBanner(
            context: context,
            theMessage: failure.message,
            theType: NotificationType.failure),
        (String successMessage) => "this $successMessage".log());

    return response.isRight();
  }

  //!
  //! GET USER INFO
  Future<bool> editUserInfo(
      {required BuildContext context, required UserModel editedInfo}) async {
    state = true;

    Either<Failure, String> response = await _profileRepository
        .editUserInfo(editedInfo: editedInfo)
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
        (String successMessage) => "this $successMessage".log());

    return response.isRight();
  }
}
