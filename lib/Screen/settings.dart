import 'package:flutter/material.dart';
import 'package:ijarah/Models/property.dart';
import 'package:provider/provider.dart';

import '../Widget/appbar.dart';
import '../constant.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var properties = Provider.of<Properties>(context, listen: false).properties;
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
                      'Profile',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
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
                  child: Column(
                    children: [
                      SizedBox(
                        height: height(context) * 4,
                      ),
                      CircleAvatar(
                        radius: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            'assets/images/sufyan1.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      Text(
                        'Sufyan Sajid',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      SizedBox(
                        height: height(context) * 0.5,
                      ),
                      Text(
                        '(Property Owner)',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                      SizedBox(
                        height: height(context) * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContactButton(
                            icon: Icons.call,
                          ),
                          SizedBox(
                            width: width(context) * 2,
                          ),
                          ContactButton(
                            icon: Icons.message,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height(context) * 3,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          'Similar Properties :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
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

class ContactButton extends StatelessWidget {
  ContactButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(238, 234, 255, 1),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Icon(
        icon,
        color: primaryColor,
      ),
    );
  }
}
