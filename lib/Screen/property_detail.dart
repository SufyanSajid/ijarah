import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/agentscren.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PropertyDetailScreen extends StatelessWidget {
  static const routeName = 'property-detail';
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var property = ModalRoute.of(context)!.settings.arguments as Property;
    var properties = Provider.of<Properties>(context).properties;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)),
        title: Column(
          children: [
            Text(
              property.price.isEmpty ? 'Price here' : property.price,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              property.address.isEmpty ? 'Address' : property.address,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExtendedImage.network(
              property.image,
              cache: true,
              width: width(context) * 100,
              fit: BoxFit.cover,
              height: height(context) * 32,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(
                  0.2,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AgentScreen.routeName,
                      arguments: property.agent);
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 30,
                  ),
                  title: Text(property.agent.name),
                  subtitle: const Text(
                    'Property Owner',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: IconButton(
                      onPressed: () async {
                        if (property.agent.phone == '') {
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
                          await launch('https://wa.me/${property.agent.phone}');
                        }
                      },
                      icon: const Icon(
                        Icons.whatsapp,
                        color: Colors.green,
                        size: 35,
                      )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
              height: height(context) * 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                property.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
            SizedBox(
              height: height(context) * 2,
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
              margin: EdgeInsets.symmetric(vertical: 40),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
      padding: EdgeInsets.symmetric(vertical: 10),
      color: color,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          flex: 1,
          child: Icon(icon),
        ),
        Expanded(
          flex: 1,
          child: Text(title),
        ),
        Expanded(
          flex: 1,
          child: Text(value),
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
