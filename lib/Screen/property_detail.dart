import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/agentscren.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Widget/bottom2.dart';
import 'package:ijarah/Widget/bottombar.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Models/appdata.dart';
import '../Widget/appbar.dart';

class PropertyDetailScreen extends StatelessWidget {
  static const routeName = 'property-detail';
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var property = ModalRoute.of(context)!.settings.arguments as Property;
    var properties = Provider.of<Properties>(context).latestProperties;
    var selectedIndex = Provider.of<App>(context).bottomBarIndex;
    return Scaffold(
      bottomNavigationBar: Bottom2(selectedIndex: selectedIndex),
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    center: Column(
                      children: [
                        Text(
                          property.price.isEmpty
                              ? 'Price here'
                              : property.price,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          property.address.isEmpty
                              ? 'Address'
                              : property.address,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: primaryColor,
                        )),
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.white,
                height: height(context) * 79,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height(context) * 32,
                        child: Swiper(
                          autoplay: true,
                          itemCount: property.image.length == 0
                              ? 1
                              : property.image.length,
                          itemBuilder: ((context, index) =>
                              ExtendedImage.network(
                                property.image.isEmpty
                                    ? 'https://peacehumanity.org/wp-content/uploads/2021/10/placeholder-236.png'
                                    : property.image.first,
                                cache: true,
                                width: width(context) * 100,
                                fit: BoxFit.cover,
                                height: height(context) * 32,
                              )),
                        ),
                      ),
                      if (property.agent != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(
                              0.2,
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AgentScreen.routeName,
                                  arguments: property.agent);
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: primaryColor,
                                radius: 30,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                        'assets/images/person22.jpeg')),
                              ),
                              title: FittedBox(
                                child: Text(
                                  property.agent!.name,
                                  maxLines: 1,
                                ),
                              ),
                              subtitle: const Text(
                                'Property Owner',
                                style: TextStyle(fontSize: 12),
                              ),
                              trailing: Contact(property: property),
                            ),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ColumnItem(
                              img: 'assets/images/bed1.svg',
                              title: '6 Bedrooms',
                            ),
                            ColumnItem(
                              img: 'assets/images/002-toilet.svg',
                              title: '6 Washrooms',
                            ),
                            ColumnItem(
                              img: 'assets/images/khitchen.svg',
                              title: '6 Kitchens',
                            ),
                            ColumnItem(
                              img: 'assets/images/parking.svg',
                              title: '6 Parkings',
                            ),
                            ColumnItem(
                              img: 'assets/images/garage.svg',
                              title: '720 ft2',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          property.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 2,
                      ),
                      Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.home_outlined,
                              title: 'PropertyId',
                              value: property.id,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.domain,
                              title: 'Price',
                              value: property.price,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.sell_outlined,
                              title: 'Bedroom',
                              value: property.bed,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.bathroom_outlined,
                              title: 'Baths',
                              value: property.bath,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.area_chart_outlined,
                              title: 'Area',
                              value: property.area,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.check_circle_outline,
                              title: 'Purpose',
                              value: property.purpose,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.map_outlined,
                              title: 'City',
                              value: property.id,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ]),
                          TableRow(children: [
                            DescriptionRow(
                              icon: Icons.location_on_outlined,
                              title: 'Location',
                              value: property.address,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: height(context) * 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Description :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height(context) * 1,
                            ),
                            Text(
                              property.description,
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: Colors.grey.withOpacity(0.5),
                        height: 1,
                        width: width(context) * 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Similar Properties :',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: height(context) * 1,
                            ),
                            SizedBox(
                              height: height(context) * 25,
                              child: ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
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
                      SizedBox(
                        height: height(context) * 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({
    Key? key,
    required this.property,
  }) : super(key: key);

  final Property property;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 5,
      width: width(context) * 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () async {
                if (property.agent!.phone == '') {
                  showDialog(
                      context: context,
                      builder: (ctx) => CupertinoAlertDialog(
                            title: Text('Error'),
                            content: Text('Phone number missing'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Okay'))
                            ],
                          ));
                } else {
                  print(property.agent!.phone);
                  await launch("tel://${property.agent!.phone}");
                }
              },
              icon: Icon(
                Icons.call,
                color: primaryColor,
                size: 30,
              )),
          IconButton(
              onPressed: () async {
                if (property.agent!.phone == '') {
                  showDialog(
                      context: context,
                      builder: (ctx) => CupertinoAlertDialog(
                            title: Text('Error'),
                            content: Text('Phone number missing'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Okay'))
                            ],
                          ));
                } else {
                  await launch('https://wa.me/${property.agent!.phone}');
                }
              },
              icon: const Icon(
                Icons.whatsapp,
                color: Colors.green,
                size: 30,
              )),
        ],
      ),
    );
  }
}

class DescriptionRow extends StatelessWidget {
  DescriptionRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  }) : super(key: key);

  String title;
  IconData icon;
  String value;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          flex: 1,
          child: Icon(
            icon,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(title),
        ),
        Expanded(flex: 1, child: Container()),
        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.left,
          ),
        ),
      ]),
    );
  }
}

class ColumnItem extends StatelessWidget {
  ColumnItem({
    Key? key,
    required this.img,
    required this.title,
  }) : super(key: key);
  String img;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          img,
          fit: BoxFit.cover,
          height: 20,
          width: 50,
        ),
        SizedBox(
          height: height(context) * 1,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
