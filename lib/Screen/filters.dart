import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = 'filters';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Filters here',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
