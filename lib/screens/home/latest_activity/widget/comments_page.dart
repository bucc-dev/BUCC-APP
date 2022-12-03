import 'package:bucc_app/screens/home/latest_activity/widget/comment_header.dart';
import 'package:bucc_app/screens/home/latest_activity/widget/comments_widget.dart';
import 'package:bucc_app/screens/widgets/custom_textfield.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 4.0.h,
          automaticallyImplyLeading: true,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back, color: Colors.black54)),
          title:
              Text("Comments", style: Theme.of(context).textTheme.bodyText1)),

      //! BODY
      body: Column(children: [
        //! HEADER
        const CommentPageHeader(),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall,

        //! DIVIDER
        Divider(
            color: AppThemeColours.primaryColourWitOpacity, thickness: 3.0.h),

        //! REST BODY
        Expanded(
            child: SingleChildScrollView(
                padding: AppScreenUtils.appMainPadding,
                physics: const BouncingScrollPhysics(),
                child: Column(
                    children: List.generate(
                        9, (index) => CommentWidget(index: index))))),

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
                  child: CustomTextField(hintText: "Enter a comment"))
            ])),

        //! SPACER
        AppScreenUtils.verticalSpaceSmall
      ]));
}
