import 'package:bucc_app/router/router.dart';
import 'package:bucc_app/router/routes.dart';
import 'package:bucc_app/theme/app_theme.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/utils/constants/colors.dart';
import 'package:bucc_app/screens/widgets/button_component.dart';
import 'package:bucc_app/screens/onboarding/widget/onboarding_component.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int page = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
          child: Padding(
              padding: AppScreenUtils.appMainPadding,
              child: Column(children: [
                //! SKIP
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () async {
                          //! SAVE PREF
                          final SharedPreferences pref =
                              await SharedPreferences.getInstance();

                          pref.setBool("showHome", true);

                          Navigator.pushNamed(context, "/onboarding_login");
                        },
                        child: Text("Skip",
                            style: CompanionAppTheme.textButtonStyle))),

                //! PAGE VIEW
                Expanded(
                    child: PageView(controller: _controller, children: const [
                  //! PAGE ONE
                  OnboardingComponent(
                      imageURL: onboardingImage1,
                      title: "Get Updated",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipg elit. Facilisis vitae diam nec lectus lobortis. semperhhjo rfhreskwfl klty."),

                  //! PAGE TWO
                  OnboardingComponent(
                      imageURL: onboardingImage2,
                      title: "Access Resources",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipg elit. Facilisis vitae diam nec lectus lobortis.  semperhhjo rfhreskwfl klty."),

                  //! PAGE THREE
                  OnboardingComponent(
                      imageURL: onboardingImage3,
                      title: "Meet up Deadlines",
                      description:
                          "Lorem ipsum dolor sit amet, consectetur adipg elit. Facilisis vitae diam nec lectus lobortis.  semperhhjo rfhreskwfl klty.")
                ])),

                //! PAGE INDICATOR
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 5, activeDotColor: purple),
                    onDotClicked: (int index) {
                      setState(() {
                        //! PAGE
                        page = index;

                        //! SCROLL TO PAGE
                        _controller.animateToPage(index,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut);
                      });
                    }),

                //! SPACER
                AppScreenUtils.verticalSpaceMedium,

                //! BUTTON
                ButtonComponent(
                    onPressed: () async {
                      if (_controller.page!.toInt() != 2) {
                        setState(() {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                          page++;
                        });
                      } else {
                        //! SAVE PREF
                        final SharedPreferences pref =
                            await SharedPreferences.getInstance();

                        pref.setBool("showHome", true);

                        AppNavigator.navigateToReplacementPage(
                            thePageRouteName: AppRoutes.onboardingLoginScreen,
                            context: context);
                      }
                    },
                    text: page != 2 ? "NEXT" : "GET STARTED"),

                //! SPACER
                AppScreenUtils.verticalSpaceSmall
              ]))));
}
