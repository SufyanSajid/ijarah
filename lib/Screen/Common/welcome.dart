import 'package:flutter/material.dart';
import 'package:ijarah/Screen/Auth/login.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/constant.dart';

class WelComeScreen extends StatelessWidget {
  static const routeName = 'welcome-screen';
  const WelComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/welcome.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: height(context) * 1,
                ),
                SizedBox(
                  width: width(context) * 56,
                  child: const Text(
                    'Find the property of your desire, rent home and sale property.',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                SizedBox(
                  height: height(context) * 5,
                ),
                WelcomeButton(
                  title: 'View Properties >',
                  icon: Icons.house_outlined,
                  onTap: () {
                    Navigator.of(context).pushNamed(Homepage.routeName);
                  },
                ),
                SizedBox(
                  height: height(context) * 2,
                ),
                WelcomeButton(
                  title: 'View Service Providers',
                  icon: Icons.account_circle_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  WelcomeButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  IconData icon;
  String title;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(context) * 56,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            SizedBox(
              width: width(context) * 1,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
