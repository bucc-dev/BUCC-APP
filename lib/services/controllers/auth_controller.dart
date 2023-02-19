// ignore_for_file: body_might_complete_normally_catch_error
import 'dart:developer';
import 'package:bucc_app/services/repositories/auth_repository.dart';
import 'package:bucc_app/utils/app_functional_utils.dart';
import 'package:bucc_app/utils/failure.dart';
import 'package:bucc_app/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
    (ref) => AuthController(
        authRepository: ref.watch(authRepositoryProvider), ref: ref));

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  // ignore: unused_field
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  //!
  //!
  //! SIGN IN
  Future<bool> signInUser(
      {required BuildContext context,
      required String matricOrEmail,
      required String password}) async {
    state = true;

    Either<Failure, bool> user = await _authRepository
        .signInUser(matricOrEmail: matricOrEmail, password: password)
        .catchError((error) {
      state = false;
      log("Error encountered: $error");
    });

    state = false;

    user.fold(
        (Failure failure) => AppFunctionalUtils.showBanner(
            context: context,
            theMessage: failure.message,
            theType: NotificationType.failure),

        //! END POINT DOESN'T RETURN A USER DATA, SO DO NOTHING
        (bool user) {});

    return user.isRight();
  }

  //!
  //! CHANGE PASSWORD
  Future<bool> changePassword(
      {required String oldPassword,
      required String newPassword,
      required BuildContext context}) async {
    state = true;

    Either<Failure, String> response = await _authRepository
        .changePassword(oldPassword: oldPassword, newPassword: newPassword)
        .catchError((error) {
      state = false;
      log("Error encountered: $error");
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
  //!
  //! FORGOT PASSWORD
  Future<bool> forgotPassword(
      {required String theUserEmail, required BuildContext context}) async {
    state = true;

    Either<Failure, String> response = await _authRepository
        .forgotPassword(email: theUserEmail)
        .catchError((error) {
      state = false;
      log("Error encountered: $error");
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
  //!
  //! RESET PASSWORD
  Future<bool> resetPassword(
      {required String theUserEmail,
      required String password,
      required String emailedToken,
      required BuildContext context}) async {
    state = true;

    Either<Failure, String> response = await _authRepository
        .resetPassword(
            email: theUserEmail, emailedToken: emailedToken, password: password)
        .catchError((error) {
      state = false;
      log("Error encountered: $error");
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
  //!
  //! LOG OUT
  Future<bool> logout() async {
    state = true;

    bool response = await _authRepository
        .logout()
        .whenComplete(() => state = false)
        .catchError((error) {
      state = false;
      log("Logout Error: $error");
    });

    return response;
  }
}
