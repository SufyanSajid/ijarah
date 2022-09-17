import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  Appbar({
    Key? key,
    required this.height,
    required this.width,
    this.leading,
    this.trailing,
    this.center,
  }) : super(key: key);

  Widget? leading;
  Widget? center;
  Widget? trailing;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leading!,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: center!,
          ),
        ),
        trailing!,
      ],
    );
  }
}
