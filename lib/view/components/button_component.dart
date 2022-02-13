import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {
  ButtonComponent({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  final Function() onPressed;
  final String text;

  ButtonStyle style = ElevatedButton.styleFrom(
    primary: purple,
    onPrimary: Colors.grey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 100),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
          ),
        ),
      ),
      style: style,
    );
  }
}
