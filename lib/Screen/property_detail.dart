import 'package:flutter/material.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/constant.dart';

class PropertyDetailScreen extends StatelessWidget {
  static const routeName = 'property-detail';
  const PropertyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var property = ModalRoute.of(context)!.settings.arguments as Property;
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
              property.price,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              property.address,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            property.image,
            width: width(context) * 100,
            fit: BoxFit.cover,
            height: height(context) * 32,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(
                0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
