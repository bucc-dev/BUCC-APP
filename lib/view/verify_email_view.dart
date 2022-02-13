import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/view/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/button_component.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(verifyEmailImage),
              const Text(
                "Check your email to verify",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  fontFamily: "Montserrat",
                ),
              ),
              const Text(
                "Please click the link in the verification email sent",
                style: TextStyle(
                  fontSize: 13.0,
                  fontFamily: "Montserrat",
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: "to ",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: "Montserrat",
                    color: lightGrey,
                  ),
                  children: [
                    TextSpan(
                      text: "nginikosi@yahoo.com. ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                        fontFamily: "Montserrat",
                        color: black,
                      ),
                    ),
                    TextSpan(
                      text: "If this email address is",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: "Montserrat",
                        color: lightGrey,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  text: "incorrect you can edit ",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: "Montserrat",
                    color: lightGrey,
                  ),
                  children: [
                    TextSpan(
                      text: "here",
                      style: TextStyle(
                        color: red,
                        fontSize: 13.0,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9.0),
                child: RichText(
                  text: const TextSpan(
                    text: "Didn't receive it?",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      color: black,
                    ),
                    children: [
                      TextSpan(
                        text: " Resend email",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: "Montserrat",
                          color: lightGrey,
                        ),
                      ),
                      TextSpan(
                        text: " or",
                        style: TextStyle(
                          fontSize: 13.0,
                          color: black,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      TextSpan(
                        text: " contact support",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: "Montserrat",
                          color: lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Use another account",
                  style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: "Montserrat",
                    color: lightGrey,
                  ),
                ),
              ),
              ButtonComponent(onPressed: () {}, text: "Next"),
            ],
          ),
        ),
      ),
    );
  }
}
