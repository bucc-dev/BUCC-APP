import 'package:bucc_app/view/components/button_component.dart';
import 'package:bucc_app/view/components/custom_app_bar.dart';
import 'package:bucc_app/view/components/custom_dropdown.dart';
import 'package:flutter/material.dart';

class JoinDepartmentView extends StatefulWidget {
  const JoinDepartmentView({Key? key}) : super(key: key);

  @override
  _JoinDepartmentViewState createState() => _JoinDepartmentViewState();
}

class _JoinDepartmentViewState extends State<JoinDepartmentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Join your Department on Companion",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat",
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: CustomDropdown(items: []),
            ),
            ButtonComponent(
                onPressed: () {
                  Navigator.pushNamed(context, "/verify_email_view");
                },
                text: "Next"),
          ],
        ),
      ),
    );
  }
}
