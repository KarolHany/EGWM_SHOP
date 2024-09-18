import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app_thw/intro_pages/intro_page1.dart';
import 'package:store_app_thw/intro_pages/intro_page2.dart';
import 'package:store_app_thw/intro_pages/intro_page3.dart';
import 'package:store_app_thw/intro_pages/intro_page4.dart';
import 'package:store_app_thw/pages/home_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static String id = "OnboardingPage";
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // _controller to keep for which page we are on
  PageController _controller = PageController();

  // check if we are in the last page
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              isLastPage = (value == 3);
            });
          },
          children: [IntroPage1(), IntroPage2(), IntroPage3(), IntroPage4()],
        ),
        Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(3);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
                SmoothPageIndicator(
                    effect: const WormEffect(
                      dotColor: Colors.white, // Color for inactive dots
                      activeDotColor: Color.fromARGB(255, 149, 21, 181), // Color for active dot
                    ),
                    controller: _controller,
                    count: 4),
                //next or done
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ))
              ],
            ))
      ],
    ));
  }
}
