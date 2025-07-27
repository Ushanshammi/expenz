import 'package:expenz_app07/constant/colors.dart';
import 'package:expenz_app07/constant/data/onboring_data.dart';
import 'package:expenz_app07/model/custom_button.dart';
import 'package:expenz_app07/screens/onbording/front_page.dart';
import 'package:expenz_app07/screens/onbording/shared_onbording_screen.dart';
import 'package:expenz_app07/screens/user_data-screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  //page controller
  PageController controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                //onbording screen
                PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnbordingScreen(
                      title: OnboringData.onbordingDataList[0].title,
                      imagepath: OnboringData.onbordingDataList[0].imagepath,
                      dis: OnboringData.onbordingDataList[0].discrip,
                    ),
                    SharedOnbordingScreen(
                      title: OnboringData.onbordingDataList[1].title,
                      imagepath: OnboringData.onbordingDataList[1].imagepath,
                      dis: OnboringData.onbordingDataList[1].discrip,
                    ),
                    SharedOnbordingScreen(
                      title: OnboringData.onbordingDataList[2].title,
                      imagepath: OnboringData.onbordingDataList[2].imagepath,
                      dis: OnboringData.onbordingDataList[2].discrip,
                    ),
                  ],
                ),
                //page dot indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                //navigation button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                    child: !showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              controller.animateToPage(
                                controller.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },

                            child: CustomButton(
                              name: showDetailsPage ? "Get Started" : "Next",
                              buttonColor: kMainColor,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              //navigate to register form
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDataScreen(),
                                ),
                              );
                            },

                            child: CustomButton(
                              name: showDetailsPage ? "Get Started" : "Next",
                              buttonColor: kMainColor,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
