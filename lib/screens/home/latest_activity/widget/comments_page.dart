import 'package:bucc_app/screens/home/latest_activity/widget/comment_header.dart';
import 'package:bucc_app/screens/home/latest_activity/widget/comments_widget.dart';
import 'package:bucc_app/screens/home/latest_activity/widget/no_comments.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/theme/theme_preferences.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsPage extends ConsumerWidget {
  const CommentsPage({super.key});
  static const bool noComments = true;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.5.h,
          shadowColor: AppThemeColours.lightGrey,
          automaticallyImplyLeading: true,
          leading: Consumer(builder: (context, ref, child) {
            String themeMode =
                ref.read(themeModeProvider.notifier).theCurrentThemeMode;

            themeMode = themeMode.toLowerCase().split(".").last;

            return IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back,
                    color: themeMode == "light"
                        ? AppThemeColours.darkGrey
                        : themeMode == "dark"
                            ? AppThemeColours.thirdGrey
                            : AppThemeColours.lightGrey));
          }),
          title:
              Text("Comments", style: Theme.of(context).textTheme.bodyLarge)),

      //! BODY
      body: Column(children: [
        //! HEADER
        const CommentPageHeader(),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! DIVIDER
        Divider(color: AppThemeColours.thirdGrey, thickness: 1.0.h),

        //! REST BODY
        Expanded(
            child: noComments
                ? const NoComments()
                : SingleChildScrollView(
                    padding: AppScreenUtils.appMainPadding,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                        children: List.generate(
                            12, (index) => CommentWidget(index: index))))),

        //! TEXT FORM FIELD && USER IMAGE
        Container(
            height: 50.0.h,
            width: double.infinity,
            padding: AppScreenUtils.appMainPadding,
            child: Row(children: [
              //! USER PROFILE PICTURE
              CircleAvatar(
                  radius: 18.0.r,
                  backgroundColor: purple.withOpacity(0.2),
                  backgroundImage: const AssetImage(defaultUserImage2)),

              //! SPACER
              AppScreenUtils.horizontalSpaceSmall,

              //! TEXT FORM FIELD
              const Expanded(
                  child: CustomTextField(
                      isHomeScreen: true, hintText: "Enter a comment"))
            ])),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall
      ]));
}
