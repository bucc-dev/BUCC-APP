// ignore_for_file: library_private_types_in_public_api
import 'package:bucc_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final int? maxLines;
  final TextEditingController? controller;
  final void Function()? onChanged;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? isHomeScreen;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.maxLines,
      this.controller,
      this.onChanged,
      this.textInputType,
      this.obscureText,
      this.suffixIcon,
      this.isHomeScreen,
      this.prefixIcon})
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
      obscureText: widget.obscureText ?? false,
      obscuringCharacter: ".",
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.w400, fontSize: 14.0.sp),

      //! ON SAVED
      onSaved: (newValue) => FocusScope.of(context).unfocus(),

      //! DECORATION
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 25.0.w,
              vertical: widget.isHomeScreen == true ? 1.0.h : 18.0.h),

          //! HINT & HINT STYLE
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppThemeColours.thirdGrey,
              fontSize: 12.0.sp),

          //! PREFIX ICON
          prefixIcon: widget.prefixIcon,
          prefixIconColor: AppThemeColours.lightGrey,

          //! SUFFIX ICON
          suffixIcon: widget.suffixIcon,
          suffixIconColor: AppThemeColours.lightGrey,

          //! BORDERS
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? widget.isHomeScreen == true
                          ? AppThemeColours.lightGrey
                          : Colors.grey.shade200
                      : Colors.white.withOpacity(0.1)),
              borderRadius: BorderRadius.all(Radius.circular(18.0.r))),

          //! FOCUSED BORDER
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppThemeColours.lightBlue),
              borderRadius: BorderRadius.all(Radius.circular(18.0.r))),

          //! ENABLED BORDER
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.light
                      ? widget.isHomeScreen == true
                          ? AppThemeColours.lightGrey
                          : Colors.grey.shade200
                      : Colors.white.withOpacity(0.8)),
              borderRadius: BorderRadius.all(Radius.circular(18.0.r)))));
}
