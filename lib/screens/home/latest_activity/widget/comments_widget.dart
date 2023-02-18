import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/theme/theme_preferences.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWidget extends ConsumerWidget {
  final int index;
  const CommentWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListTile(
      contentPadding: EdgeInsets.zero,

      //! USER IMAGE
      leading: CircleAvatar(
          radius: 21.0.r,
          backgroundColor: Colors.white,
          backgroundImage: const AssetImage(defaultUserImage3)),

      //! TITLE
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //! THE COMMENT
        Text(
            index.isOdd
                ? "Sounds Fantastic, can’t wait!! See you there"
                : "i’ve been anticipating this for so long and it’s finally here",
            style: Theme.of(context).textTheme.bodyMedium),

        //! TIME && BUTTON
        Row(children: [
          //! DATE
          Consumer(builder: (context, ref, child) {
            String themeMode =
                ref.read(themeModeProvider.notifier).theCurrentThemeMode;

            themeMode = themeMode.toLowerCase().split(".").last;

            return Text("3w",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: themeMode == "light"
                        ? AppThemeColours.thirdGrey
                        : AppThemeColours.lightGrey,
                    fontSize: 11.0.sp));
          }),

          //! REPLY BUTTON
          Consumer(builder: (context, ref, child) {
            String themeMode =
                ref.read(themeModeProvider.notifier).theCurrentThemeMode;

            themeMode = themeMode.toLowerCase().split(".").last;
            return TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text("Reply",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: themeMode == "light"
                            ? AppThemeColours.thirdGrey
                            : AppThemeColours.lightGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.0.sp)));
          })
        ])
      ]));
}
