import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWidget extends StatelessWidget {
  final int index;
  const CommentWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) => ListTile(
      contentPadding: EdgeInsets.zero,

      //! USER IMAGE
      leading: CircleAvatar(
          radius: 18.0.r,
          backgroundColor: Colors.white,
          backgroundImage: const AssetImage(defaultUserImage3)),

      //! TITLE
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //! THE COMMENT
        Text(
            index.isOdd
                ? "Sounds Fantastic, can’t wait!! See you there"
                : "i’ve been anticipating this for so long and it’s finally here",
            style: Theme.of(context).textTheme.bodyText2),

        //! TIME && BUTTON
        Row(children: [
          //! DATE
          Text("3w",
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 11.0.sp)),

          //! REPLY BUTTON
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text("Reply",
                  style: CompanionAppTheme.textButtonStyle
                      .copyWith(fontSize: 11.0.sp)))
        ])
      ]));
}
