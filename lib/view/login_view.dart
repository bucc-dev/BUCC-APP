import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/view/components/custom_app_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'components/button_component.dart';
import 'components/custom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    "Log in to your Companion Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                const CustomTextField(
                  hintText: "Matric Number or Email",
                ),
                const CustomTextField(
                  hintText: "Password",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 11,
                        color: blue,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ButtonComponent(
                      onPressed: () {
                        Navigator.pushNamed(context, "/get_started_view");
                      },
                      text: "Login"),
                ),
                const Text(
                  "By signing up, you agree to our",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Terms of Service",
                    style: const TextStyle(
                      color: red,
                      fontFamily: "Montserrat",
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    children: [
                      const TextSpan(
                        text: " and ",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          color: red,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 28.0),
                  child: Text(
                    "Companion is brought to you by Babcock University Computer Club",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: lightGrey,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
