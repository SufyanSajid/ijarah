import 'package:flutter/material.dart';

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

  Property({
    required this.id,
    required this.name,
    required this.area,
    required this.purpose,
    required this.type,
    required this.price,
    required this.bed,
    required this.bath,
    required this.address,
    required this.description,
    required this.image,
  });
}

class Properties with ChangeNotifier {
  final List<Property> _properties = [
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
      image: 'assets/images/property.png',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
    Property(
      id: '2',
      name: '350 Sq Yd Villa Available For Sale Precinct 35',
      area: '675 Sq.Ft',
      purpose: 'Sale',
      type: 'Villa',
      price: 'PKR 2 Crore',
      bed: '6',
      bath: '4',
      image: 'assets/images/property.png',
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
      bath: '2',
      image: 'assets/images/property.png',
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
      bath: '2',
      image: 'assets/images/property.png',
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
      bath: '2',
      image: 'assets/images/property.png',
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
      image: 'assets/images/property.png',
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
      image: 'assets/images/property.png',
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
      bath: '2',
      image: 'assets/images/property.png',
      address: 'Karachi Sindh',
      description:
          'Siraat Real Estate and Builders is an emerging real estate marketing, sales,and construction company. We are a network of professionally trained and specialized property consultants and advisors. We deal in almost all the leading projects of Pakistan and offers fair and dependable consultancy services.',
    ),
  ];

  List<Property> get properties {
    return [..._properties];
  }
}
