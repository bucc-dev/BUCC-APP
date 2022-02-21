///The latest activity tab, is built to wrap a custom post widget.
///The custom post widget is called by a List view builder, to lazily build ...
///...each post, as activities build up on the stream

import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_posts.dart';
import 'package:flutter/material.dart';

class LatestActivity extends StatelessWidget {
  const LatestActivity({Key? key}) : super(key: key);

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
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: lightGrey,
                thickness: 0.5,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return CustomPost(
                isImagePresent: index == 1 ? false : true,
              );
            },
          ),
        ),
      ],
    );
  }
}
