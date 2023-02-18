import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.style,
      this.textStyle})
      : super(key: key);

  final Function() onPressed;
  final String text;
  final ButtonStyle? style;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: double.infinity.w,
      child: ElevatedButton(
          onPressed: onPressed,
          style: style,
          child: Text(text, style: textStyle)));
}
