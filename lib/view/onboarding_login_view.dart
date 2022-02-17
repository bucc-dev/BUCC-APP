import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/components/button_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingLoginView extends StatelessWidget {
  const OnBoardingLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: "BU",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: black,
                      ),
                      children: [
                        TextSpan(
                          text: "CC",
                          style: TextStyle(
                            color: purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: "COMP",
                    style: TextStyle(
                      color: purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    children: [
                      TextSpan(
                        text: "ANION",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(loginImage),
            ),
            ButtonComponent(
                onPressed: () {
                  Navigator.pushNamed(context, "/user_type_view");
                },
                text: "Login"),
          ],
        ),
      ),
    );
  }
}
