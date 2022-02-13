import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<DropdownMenuItem<dynamic>>? items;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: lightGrey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 25.0,
        padding: const EdgeInsets.all(10),
        // child: DropdownButton(
        //   items: widget.items,

        //   onChanged: (value) {},
        // ),
      ),
    );
  }
}
