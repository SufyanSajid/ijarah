import 'package:flutter/material.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Screen/property_detail.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            onTap: () async {
                              await launch("tel://+9230167550840");
                            },
                            icon: Icons.call,
                          ),
                          SizedBox(
                            width: width(context) * 2,
                          ),
                          ContactButton(
                            onTap: () async {
                              await launch('https://wa.me/+9230167550840');
                            },
                            icon: Icons.whatsapp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          'Properites :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: 4,
                          itemBuilder: (ctx, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  PropertyDetailScreen.routeName,
                                  arguments: properties[index]);
                            },
                            child: PropertyWidget(
                              property: properties[index],
                            ),
                          ),
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
    required this.onTap,
  }) : super(key: key);

  IconData icon;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(238, 234, 255, 1),
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Icon(
          icon,
          color: primaryColor,
        ),
      ),
    );
  }
}
