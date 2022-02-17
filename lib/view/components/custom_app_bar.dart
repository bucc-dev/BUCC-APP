import 'package:bucc_app/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.arrow_left),
        color: black,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: RichText(
        text: const TextSpan(
          text: "BU",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            fontFamily: "Montserrat",
            color: black,
          ),
          children: [
            TextSpan(
              text: "CC ",
              style: TextStyle(
                color: purple,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: "Montserrat",
              ),
            ),
            TextSpan(
              text: "COMP",
              style: TextStyle(
                color: purple,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: "Montserrat",
              ),
            ),
            TextSpan(
              text: "ANION",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: black,
                fontFamily: "Montserrat",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
