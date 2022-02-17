import 'package:bucc_app/utils/constants/app_constants.dart';
import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/components/button_component.dart';
import 'package:bucc_app/view/components/onboarding_component.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/onboarding_login");
                  },
                  child: const Text(
                    "Skip",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 16,
                        color: black,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                children: const [
                  OnboardingComponent(
                    imageurl: onboardingImage1,
                    title: "Get Updated",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipg elit. Facilisis vitae diam nec lectus lobortis. semperhhjo rfhreskwfl klty.",
                  ),
                  OnboardingComponent(
                    imageurl: onboardingImage2,
                    title: "Access Resources",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipg elit. Facilisis vitae diam nec lectus lobortis.  semperhhjo rfhreskwfl klty.",
                  ),
                  OnboardingComponent(
                    imageurl: onboardingImage3,
                    title: "Meet up Deadlines",
                    description:
                        "Lorem ipsum dolor sit amet, consectetur adipg elit. Facilisis vitae diam nec lectus lobortis.  semperhhjo rfhreskwfl klty.",
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 5,
                activeDotColor: purple,
              ),
              onDotClicked: (int index) {
                setState(() {
                  _controller.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                  page = index;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ButtonComponent(
                onPressed: () {
                  if (_controller.page!.toInt() != 2) {
                    setState(() {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                      page++;
                    });
                  } else {
                    Navigator.pushNamed(context, "/onboarding_login");
                  }
                },
                text: page != 2 ? "NEXT" : "GET STARTED",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
