import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../constant.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = 'filters';
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Appbar(
                      height: height(context),
                      width: width(context),
                      leading: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      center: const Center(
                          child: Text(
                        'Filters',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                      trailing: Text(
                        'sufyan',
                        style: TextStyle(color: primaryColor),
                      )),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: height(context) * 79,
                  width: width(context) * 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
