///!IF TEXT TYPE IS A TITLE, PASS IN TITLE AS STRING TO TEXT TYPE parameter
///!TEXT TYPE = SUBTITLE, PASS IN SUBTITLE TO SUBTYPE PARAMETER
///!TEXT TYPE = BODY, PASS IN NULL OR REGULAR EMPTY STRING

import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String textType;
  final String text;
  final TextStyle? customTextStyle;
  //final TextStyle fontStyle;
  const CustomTextWidget({
    Key? key,
    required this.textType,
    required this.text,
    this.customTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: (textType == "title")
          ? const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            )
          : (textType == "subtitle")
              ? const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF5F5F5F),
                )
              : customTextStyle,
    );
  }
}
