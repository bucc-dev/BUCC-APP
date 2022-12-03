import 'package:bucc_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final int? maxLines;
  final TextEditingController? controller;
  final void Function()? onChanged;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.maxLines,
      this.controller,
      this.onChanged})
      : super(key: key);

  final String hintText;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) => TextFormField(
      maxLines: widget.maxLines,
      controller: widget.controller,
      onChanged: (value) => widget.onChanged!(),
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 21.0.w, vertical: 21.0.h),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppThemeColours.lightGrey,
              fontSize: 12.0.sp),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200),
              borderRadius: const BorderRadius.all(Radius.circular(10.0)))));
}