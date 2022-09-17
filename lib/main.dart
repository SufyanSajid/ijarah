import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijarah/Models/appdata.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/Auth/login.dart';
import 'package:ijarah/Screen/Auth/sign_up.dart';
import 'package:ijarah/Screen/Common/splash_screen.dart';
import 'package:ijarah/Screen/Common/welcome.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Screen/launcing.dart';
import 'package:ijarah/Screen/onboarding/rent.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => App(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Properties(),
        ),
      ],
      child: MaterialApp(
        title: 'Ijarah',
        theme: ThemeData(),
        routes: {
          '/': (ctx) => NewLauncingScreen(),
          WelComeScreen.routeName: (ctx) => WelComeScreen(),
          OnBoardingScreen.routeName: (ctx) => OnBoardingScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUpScreen.routename: (ctx) => SignUpScreen(),
          Homepage.routeName: (ctx) => Homepage(),
          NewLauncingScreen.routeName: (ctx) => NewLauncingScreen()
        },
      ),
    );
  }
}
