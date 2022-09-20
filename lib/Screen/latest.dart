import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Screen/property_detail.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';

import '../Models/appdata.dart';
import '../Widget/appbar.dart';

class LatestScreen extends StatefulWidget {
  static const routeName = 'latest';
  const LatestScreen({super.key});

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    if (isFirst) {
      isFirst = false;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<Property> properties;
    String type = ModalRoute.of(context)!.settings.arguments as String;
    if (type == 'All') {
      print('all');
      properties = Provider.of<Properties>(context).latestProperties;
      print(properties.length);
    } else {
      print(type);
      properties = Provider.of<Properties>(context, listen: false)
          .getCatgeoryProperties(type);
      print(properties.length);
    }

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: Platform.isAndroid
                      ? EdgeInsets.only(top: 10)
                      : EdgeInsets.zero,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Appbar(
                    height: height(context),
                    width: width(context),
                    leading: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    center: const Center(
                        child: Text(
                      'Latest Properties',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                    trailing: IconButton(
                      onPressed: () {
                        Provider.of<App>(context, listen: false).setIndex(1);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  height: height(context) * 86,
                  width: width(context) * 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: properties.isEmpty
                      ? const Center(
                          child: Text('No Properties to show'),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                type == 'All' ? 'Latest' : type,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: height(context) * 1.5,
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 0.0,
                                  mainAxisSpacing: 15.0,
                                ),
                                itemCount: properties.length,
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
                            )
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
