import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingComponent extends StatelessWidget {
  const OnboardingComponent(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.description})
      : super(key: key);

  final String imageURL, title, description;

  @override
  Widget build(BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! IMAGE
            SvgPicture.asset(imageURL),

            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! TITLE
            Text(title,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center),

            //! SPACER
            AppScreenUtils.verticalSpaceSmall,

            //! NOTE
            Text(description,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center)
          ]);
}
