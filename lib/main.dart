import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ijarah/Models/appdata.dart';
import 'package:ijarah/Models/filters.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/Auth/login.dart';
import 'package:ijarah/Screen/Auth/sign_up.dart';
import 'package:ijarah/Screen/Common/splash_screen.dart';
import 'package:ijarah/Screen/Common/welcome.dart';
import 'package:ijarah/Screen/agentscren.dart';
import 'package:ijarah/Screen/filterprop.dart';
import 'package:ijarah/Screen/filters.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Screen/latest.dart';
import 'package:ijarah/Screen/launcing.dart';
import 'package:ijarah/Screen/onboarding/rent.dart';
import 'package:ijarah/Screen/property_detail.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
        ChangeNotifierProvider(
          create: (ctx) => Filters(),
        ),
      ],
      child: MaterialApp(
        title: 'GotiJarah',
        theme: ThemeData(fontFamily: 'Calibri'),
        routes: {
          '/': (ctx) => SplashScreen(),
          WelComeScreen.routeName: (ctx) => const WelComeScreen(),
          OnBoardingScreen.routeName: (ctx) => OnBoardingScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignUpScreen.routename: (ctx) => SignUpScreen(),
          Homepage.routeName: (ctx) => Homepage(),
          NewLauncingScreen.routeName: (ctx) => const NewLauncingScreen(),
          LatestScreen.routeName: (ctx) => const LatestScreen(),
          PropertyDetailScreen.routeName: (ctx) => PropertyDetailScreen(),
          AgentScreen.routeName: (ctx) => AgentScreen(),
          FilterScreen.routeName: (ctx) => FilterScreen(),
          FilterPropertyScreen.routeName: (ctx) => FilterPropertyScreen(),
        },
      ),
    );
  }
}
