//import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ijarah/Screen/Common/welcome.dart';
import 'package:ijarah/Screen/onboarding/deed.dart';
import 'package:ijarah/Screen/onboarding/leads.dart';
import '../../constant.dart';

class OnBoardingScreen extends StatefulWidget {
  static const routeName = '/onboard';
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      setState(() {
        currentIndex = currentIndex + 1;
        pageController.animateToPage(currentIndex,
            duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    var height1 = (MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top) /
        100;
    var width1 = MediaQuery.of(context).size.width / 100;
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    Widget rent = Column(
      children: [
        Image.asset(
          'assets/images/rent.jpg',
          height: height(context) * 45,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: height(context) * 8,
        ),
        SizedBox(
          width: width(context) * 65,
          child: Column(
            children: [
              const Text(
                'Buy, Rent & Sale',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height(context) * 2,
              ),
              const Text(
                'We care a about your budget. We take your around under your budget scale and show you the perfect option always.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
      ],
    );
    List<Widget> _tabs = [rent, LeadContainer(), Deeds()];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    print(value);
                    if (currentIndex == 0) {
                      Timer(Duration(seconds: 2), () {
                        pageController.animateToPage(1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      });
                    }

                    currentIndex = value;
                  });
                },
                itemCount: _tabs.length,
                itemBuilder: (ctx, index) => _tabs[index],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    _tabs.length,
                    (i) => buildDot(
                      index: i,
                      currentIndex: currentIndex,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(WelComeScreen.routeName);
                    },
                    child: Text(
                      'Skip >',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}

class buildDot extends StatelessWidget {
  buildDot({
    Key? key,
    required this.index,
    required this.currentIndex,
  }) : super(key: key);
  int index;
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.only(bottom: 0, left: 5),
      height: 8,
      width: currentIndex == index ? 22 : 8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: currentIndex == index ? Colors.black : Colors.grey),
    );
  }
}
