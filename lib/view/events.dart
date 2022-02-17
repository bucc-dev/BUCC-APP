import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_event.dart';
import 'package:bucc_app/view/custom_widgets/custom_posts.dart';
import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  Events({Key? key}) : super(key: key);
  final List<String> _eventDates = [
    "Monday, 28 Feb 2022",
    "Tuesday, 1 Mar 2022",
    "Wednesday, 2 Mar 2022",
    "Thursday, 3 Mar 2022",
  ];

  final List<String> _eventsTitles = [
    "Glow Night",
    "BUCC Seminar",
    "Movie Night",
    "Software Exhibition",
    "BUCC League",
    "Dinner Night",
  ];

  final List<String> _eventLocations = [
    "University Stadium",
    "CIT",
    "BBS Auditorium A",
    "CIT",
    "University Stadium",
    "University Stadium",
  ];

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        //!SPACER
        Container(
          height: _screenSize.height * 0.02,
          color: lightGrey.withOpacity(0.1),
        ),

        //!DATA TO BE DISPLAYED
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return CustomEvent(
                theDay: _eventDates[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
