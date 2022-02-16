import 'package:flutter/material.dart';

import 'components/button_component.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Welcome to BUCC Companion,",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Adaeze Chamberlain",
                style: TextStyle(
                  fontSize: 14.0,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ButtonComponent(
                    onPressed: () {
                      //Navigator.pushNamed(context, "/join_department_view");
                      Navigator.pushNamed(context, "/home_screen");
                    },
                    text: "Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
