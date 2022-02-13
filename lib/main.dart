import 'package:bucc_app/view/get_started_view.dart';
import 'package:bucc_app/view/join_department.dart';
import 'package:bucc_app/view/login_view.dart';
import 'package:bucc_app/view/onboarding_login_view.dart';
import 'package:bucc_app/view/onboarding_view.dart';
import 'package:bucc_app/view/verify_email_view.dart';
import 'package:flutter/material.dart';

import 'view/user_type_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BUCC Companion App',
      theme: ThemeData(primaryColor: Colors.white),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        '/': (_) => const OnboardingView(),
        '/onboarding_login': (_) => const OnBoardingLoginView(),
        '/user_type_view': (_) => const UserTypeView(),
        '/login_view': (_) => const LoginView(),
        '/get_started_view': (_) => const GetStartedView(),
        '/join_department_view': (_) => const JoinDepartmentView(),
        '/verify_email_view': (_) => const VerifyEmailView(),
      },
    );
  }
}
