import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class Feature {
  String id;
  String name;

  Feature({
    required this.id,
    required this.name,
  });
}

//phone and user not added in model due to lack of information
class Property {
  String id;
  String name;
  String type;
  String price;
  String bed;
  String bath;
  String area;
  String image;
  String purpose;
  String address;
  String description;
  String date;
  String city;
  List<Feature> features;

  Property({
    required this.id,
    required this.name,
    required this.area,
    required this.purpose,
    required this.type,
    required this.price,
    required this.bed,
    required this.bath,
    required this.city,
    required this.address,
    required this.description,
    required this.image,
    required this.date,
    required this.features,
  });
}

class Properties with ChangeNotifier {
  List<Property> _properties = [
    Property(
      id: '1',
      name: '550 Sq Yd House Available For Rent Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Rent',
      type: 'House',
      price: 'PKR 50 Thousand',
      bed: '4',
      bath: '2',
      address: 'Sargodha Punjab',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      features: [],
      date: '',
      city: '',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '2',
      features: [],
      date: '',
      city: '',
      name: '350 Sq Yd Villa Available For Sale Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Sale',
      type: 'Villa',
      price: 'PKR 2 Crore',
      bed: '6',
      bath: '4',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Sargodha Punjab',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '3',
      name: '150 Sq Yd Flat Available For Sale Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Sale',
      type: 'Flat',
      price: 'PKR 50 Lac',
      bed: '3',
      features: [],
      date: '',
      city: '',
      bath: '2',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Lahore Punjab',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '4',
      name: '350 Sq Yd Shop Available For Rent Precinct 35',
      area: '425 Sq.Ft',
      purpose: 'Rent',
      type: 'Shop',
      price: 'PKR 1 Lac',
      bed: '4',
      features: [],
      date: '',
      city: '',
      bath: '2',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Karachi Sindh',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '12',
      name: '550 Sq Yd House Available For Rent Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Rent',
      type: 'House',
      price: 'PKR 50 Thousand',
      bed: '4',
      features: [],
      date: '',
      city: '',
      bath: '2',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Sargodha Punjab',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '22',
      name: '350 Sq Yd Villa Available For Sale Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Sale',
      type: 'Villa',
      price: 'PKR 2 Crore',
      bed: '6',
      bath: '4',
      features: [],
      date: '',
      city: '',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Sargodha Punjab',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '32',
      name: '150 Sq Yd Flat Available For Sale Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Sale',
      type: 'Flat',
      price: 'PKR 50 Lac',
      bed: '3',
      bath: '2',
      features: [],
      date: '',
      city: '',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Lahore Punjab',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '41',
      name: '350 Sq Yd Shop Available For Rent Precinct 35',
      area: '425 Sq.Ft',
      purpose: 'Rent',
      type: 'Shop',
      price: 'PKR 1 Lac',
      bed: '4',
      features: [],
      date: '',
      city: '',
      bath: '2',
      image:
          'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      address: 'Karachi Sindh',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
  ];

  List<Property> get properties {
    return [..._properties];
  }

  List<Property> _newLaunhings = [];

  List<Property> get newLaunching {
    return [..._newLaunhings];
  }

  List<Property> _latestProperties = [];

  List<Property> get latestProperties {
    return [..._latestProperties];
  }

  List<String> _categories = [];

  List<String> get catgeories {
    return [..._categories];
  }

  Future<void> fetchAndSetProperties() async {
    List<Property> tempLaunch = [];
    List<Property> tempLatest = [];
    List<String> tempCat = [];
    final url = Uri.parse('${baseUrl}home-posts');

    var response = await http.get(url);

    var extractedResponse = json.decode(response.body);
    if (extractedResponse['success'] == true) {
      //new launchings
      var newLaunch = extractedResponse['new_launching'] as List<dynamic>;
      newLaunch.forEach((prop) {
        List<Feature> tempFeatures = [];
        var features = prop['property_feature'] as List<dynamic>;
        features.forEach((feature) {
          tempFeatures.add(
            Feature(
              id: feature['term_id'],
              name: feature['name'],
            ),
          );
        });
        tempLaunch.add(Property(
          id: prop['id'].toString(),
          name: prop['post_title'],
          area: prop['size'] == null ? '' : prop['size'],
          purpose: prop['purpose'],
          type: prop['property_type'] == null ? '' : prop['property_type'],
          price: prop['price'],
          bed: prop['bedrooms'],
          bath: prop['bathrooms'],
          city: prop['city'],
          address: prop['address'],
          description: prop['description'],
          image: prop['image'],
          date: prop['post_date'],
          features: tempFeatures,
        ));
      });

      //new launch end

      //latest
      var latestProp = extractedResponse['latest'] as List<dynamic>;
      latestProp.forEach((prop) {
        List<Feature> tempFeatures = [];
        var features = prop['property_feature'] as List<dynamic>;
        features.forEach((feature) {
          tempFeatures.add(
            Feature(
              id: feature['term_id'],
              name: feature['name'],
            ),
          );
        });
        tempLatest.add(Property(
          id: prop['id'].toString(),
          name: prop['post_title'],
          area: prop['size'] == null ? '' : prop['size'],
          purpose: prop['purpose'],
          type: prop['property_type'] == null ? '' : prop['property_type'],
          price: prop['price'],
          bed: prop['bedrooms'],
          bath: prop['bathrooms'],
          city: prop['city'],
          address: prop['address'],
          description: prop['description'],
          image: prop['image'],
          date: prop['post_date'],
          features: tempFeatures,
        ));
      });
      print(newLaunching.length);

      var cats = extractedResponse['category'] as List<dynamic>;
      cats.forEach((c) {
        tempCat.add(c);
      });

      _newLaunhings = tempLaunch;
      _latestProperties = tempLatest;
      _categories = tempCat;

      notifyListeners();

      //latest end
    } else {
      print('error in fetch and set properties');
    }
  }
}
