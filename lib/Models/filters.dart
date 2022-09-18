import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Filter {
  String minPrice;
  String maxPrice;
  String minSize;
  String maxSize;
  List<String> bedrooms;
  List<String> bathrooms;
  List<String> propertyType;
  List<String> purpose;
  List<String> cities;
  Filter({
    required this.minPrice,
    required this.maxPrice,
    required this.minSize,
    required this.maxSize,
    required this.bedrooms,
    required this.bathrooms,
    required this.cities,
    required this.propertyType,
    required this.purpose,
  });
}

class Filters with ChangeNotifier {
  Filter? filter;

  Future<void> getFilterValues() async {
    List<String> tempBed = [];
    List<String> tempBath = [];
    List<String> tempCities = [];
    List<String> tempType = [];
    List<String> tempPurpose = [];
    final url = Uri.parse(
        'https://gotijarah.pk/tijarah-backend/public/api/get-filters');
    var response = await http.get(url);
    var extractedResponse = json.decode(response.body);

    if (extractedResponse['success'] == true) {
      var data = extractedResponse['data'];
      //bed
      var bed = data['bedrooms'] as List<dynamic>;
      bed.forEach((bed) {
        tempBed.add(bed);
      });
      //bed
      //bath
      var bath = data['bathrooms'] as List<dynamic>;
      bath.forEach((bath) {
        tempBath.add(bath);
      });
      //bath
      //property_type
      var p_type = data['property_type'] as List<dynamic>;
      p_type.forEach((pt) {
        tempType.add(pt);
      });
      //property_type
      //purpose
      var purpose = data['type'] as List<dynamic>;
      purpose.forEach((p) {
        tempPurpose.add(p);
      });
      //purpose
      //purpose
      var cities = data['cities'] as List<dynamic>;
      cities.forEach((c) {
        tempCities.add(c);
      });
      //purpose

      filter = Filter(
        minPrice: data['min_price'],
        maxPrice: data['max_price'],
        minSize: data['min_size'],
        maxSize: data['max_size'],
        bedrooms: tempBed,
        bathrooms: tempBath,
        cities: tempCities,
        propertyType: tempType,
        purpose: tempPurpose,
      );
    } else {
      print('error in getting filters');
    }
  }
}