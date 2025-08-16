import 'package:flutter/material.dart';
import 'package:onboarding_example/models/onboarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController controller = PageController();

  final List<BoardingModel> boardingList = [
    BoardingModel(image: 'assets/images/Group.png', title: 'Trending news'),
    BoardingModel(image: 'assets/images/Group (1).png', title: 'React, Save & Share News'),
    BoardingModel(image: 'assets/images/Group (2).png', title: 'Video & live News From YouTube'),
    BoardingModel(image: 'assets/images/Group (3).png', title: 'Browse News From Variety Of Categories'),
  ];


  @override
  Widget build(BuildContext context) {
      final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Column(
        children: [
          // Onboarding pages
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: boardingList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Spacer(flex: 2),
                      Image.asset(
                        boardingList[i].image,
                        width: screenWidth * 0.75,
                        height: screenHeight * 0.3,
                        fit: BoxFit.contain,
                      ),
                      Spacer(flex: 2),
                      Text(
                        boardingList[i].title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                );
              },
            ),
          ),

          // Dots Indicator
          SmoothPageIndicator(
            controller: controller,
            count: boardingList.length,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.grey,
              activeDotColor: Colors.blueAccent,
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // Continue with Email Button
          Container(
            height: screenHeight * 0.065,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.email, color: Colors.white, size: 20),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Continue with Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.04),

          // Social Login Buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _socialIcon('assets/images/logos_facebook.png'),
                SizedBox(width: screenWidth * 0.025),
                _socialIcon('assets/images/devicon_google.png'),
                SizedBox(width: screenWidth * 0.025),
                _socialIcon('assets/images/Vector.png'),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }
}

  Widget _socialIcon(String assetPath) {
    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey),
        ),
        child: Image.asset(assetPath),
      ),
    );
  }

