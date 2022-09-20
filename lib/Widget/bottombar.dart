import 'package:flutter/material.dart';
import 'package:ijarah/Models/appdata.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({
    super.key,
    required this.selectedIndex,
  });

  int selectedIndex;

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: height(context) * 8,
      width: width(context) * 100,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 242, 1),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              offset: -const Offset(2, 2),
              blurRadius: 5,
              spreadRadius: 1)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Provider.of<App>(context, listen: false).setIndex(0);
            },
            icon: Icon(
              widget.selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              color: widget.selectedIndex == 0 ? primaryColor : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<App>(context, listen: false).setIndex(1);
            },
            icon: Icon(
              widget.selectedIndex == 1
                  ? Icons.dashboard
                  : Icons.dashboard_outlined,
              color: widget.selectedIndex == 1 ? primaryColor : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<App>(context, listen: false).setIndex(2);
            },
            icon: Icon(
              widget.selectedIndex == 2
                  ? Icons.bookmark
                  : Icons.bookmark_outline,
              color: widget.selectedIndex == 2 ? primaryColor : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              // Provider.of<App>(context, listen: false).setIndex(3);
            },
            icon: Icon(
              widget.selectedIndex == 3
                  ? Icons.settings
                  : Icons.settings_outlined,
              color: widget.selectedIndex == 3 ? primaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
