import 'package:flutter/material.dart';

import '../../constant.dart';

class LeadContainer extends StatelessWidget {
  const LeadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/leads.jpg',
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
              Text(
                'Generate Leads',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height(context) * 2,
              ),
              Text(
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
