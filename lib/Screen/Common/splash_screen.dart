import 'package:flutter/material.dart';
import 'package:ijarah/Screen/onboarding/rent.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3)).then(
        (value) => Navigator.of(context).pushNamed(OnBoardingScreen.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
