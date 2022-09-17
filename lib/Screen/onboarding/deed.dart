import 'package:flutter/material.dart';

import '../../constant.dart';

class Deeds extends StatelessWidget {
  const Deeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/welcome.jpg',
          height: height(context) * 45,
          width: width(context) * 100,
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
                'Generate Deeds',
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
  }
}
