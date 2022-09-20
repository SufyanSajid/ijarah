import 'package:flutter/material.dart';
import 'package:ijarah/Models/appdata.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';

class Bottom2 extends StatefulWidget {
  Bottom2({
    super.key,
    required this.selectedIndex,
  });

  int selectedIndex;

  @override
  State<Bottom2> createState() => _Bottom2State();
}

class _Bottom2State extends State<Bottom2> {
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
              Navigator.of(context).pushNamed(Homepage.routeName);
            },
            icon: Icon(
              widget.selectedIndex == 0 ? Icons.home : Icons.home_outlined,
              color: widget.selectedIndex == 0 ? primaryColor : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<App>(context, listen: false).setIndex(1);
              Navigator.of(context).pushNamed(Homepage.routeName);
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
              Navigator.of(context).pushNamed(Homepage.routeName);
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
              Provider.of<App>(context, listen: false).setIndex(3);
              Navigator.of(context).pushNamed(Homepage.routeName);
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
