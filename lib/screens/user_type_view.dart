//! TODO: REMOVE THIS FILE

/* import 'package:bucc_app/view/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/button_component.dart';

class UserTypeView extends StatelessWidget {
  const UserTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Who are you?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: "Montserrat",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ButtonComponent(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login_view");
                    },
                    text: "Lecturer"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ButtonComponent(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login_view");
                    },
                    text: "Student"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */