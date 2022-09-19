import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ijarah/Models/agent.dart';
import 'package:html/parser.dart';

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
  List<String> image;
  String purpose;
  String address;
  String description;
  String date;
  String city;
  String phone;
  Agent? agent;
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
    this.agent,
    required this.phone,
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
      phone: '+923167550840',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Sargodha Punjab',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Lahore Punjab',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Karachi Sindh',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Sargodha Punjab',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Sargodha Punjab',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Lahore Punjab',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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
      phone: '+923167550840',
      image: [
        'https://3.imimg.com/data3/XJ/AK/MY-13479662/property-buyer-500x500.png',
      ],
      address: 'Karachi Sindh',
      agent: Agent(
          id: '1',
          name: 'Sufyan Sajid',
          email: 'themssk@gmail.com',
          phone: '+923167550840'),
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

  List<Property> _filterProperties = [];

  List<Property> get filterProperties {
    return [..._filterProperties];
  }

  List<Property> _agentProperties = [];

  List<Property> get agentProperties {
    return [..._agentProperties];
  }

  List<String> _categories = [];

  List<String> get catgeories {
    return [..._categories];
  }

  List<String> bannerUrls = [];

  String banner = '';
  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  Future<void> fetchAndSetProperties() async {
    List<Property> tempLaunch = [];
    List<Property> tempLatest = [];
    List<String> tempCat = [];
    final url = Uri.parse('${baseUrl}home-posts');

    var response = await http.get(url);

    var extractedResponse = json.decode(response.body);
    if (extractedResponse['success'] == true) {
      var banAd = extractedResponse['banner'] as List<dynamic>;
      banAd.forEach((ban) {
        bannerUrls.add(ban['guid']);
      });
      print(bannerUrls.first);
      banner = bannerUrls.first;
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
        var user = prop['user'];
        Agent? tempAgent;
        if (user != null) {
          tempAgent = Agent(
              id: user['id'].toString(),
              email: user['user_email'],
              name: user['user_nicename'],
              phone: prop['phone']);
        } else {
          tempAgent = null;
        }
        List<String> imageUrls = [];
        var images = prop['image'] as List<dynamic>;
        images.forEach((img) {
          imageUrls.add(img['guid']);
        });
        var descrip = _parseHtmlString(prop['description']);

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
          description: descrip,
          image: imageUrls,
          date: prop['post_date'],
          phone: prop['phone'],
          agent: tempAgent != null ? tempAgent : null,
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
        var user = prop['user'];
        Agent? tempAgent;
        if (user != null) {
          tempAgent = Agent(
              id: user['id'].toString(),
              email: user['user_email'],
              name: user['user_nicename'],
              phone: prop['phone']);
        } else {
          tempAgent = null;
        }
        List<String> imageUrls = [];
        var images = prop['image'] as List<dynamic>;
        images.forEach((img) {
          imageUrls.add(img['guid']);
        });
        var descrip = _parseHtmlString(prop['description']);
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
          description: descrip,
          image: imageUrls,
          date: prop['post_date'],
          phone: prop['phone'],
          agent: tempAgent,
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

  Future<void> getFilterProperties({
    required String purpose,
    required String city,
    required String type,
    required String minPrice,
    required String maxPrice,
  }) async {
    _filterProperties = [];
    List<Property> tempFilterProps = [];
    final url = Uri.parse('${baseUrl}filter-properties');

    var response = await http.post(url, body: {
      'purpose': purpose,
      'city': city,
      'types': type,
      'min_price': minPrice,
      'max_price': maxPrice,
    });

    print(response.body);
    var extractedResponse = json.decode(response.body);
    if (extractedResponse['success'] == true) {
      var data = extractedResponse['data'] as List<dynamic>;
      data.forEach((prop) {
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
        var user = prop['user'];
        Agent? tempAgent;
        if (user != null) {
          tempAgent = Agent(
              id: user['id'].toString(),
              email: user['user_email'],
              name: user['user_nicename'],
              phone: prop['phone']);
        } else {
          tempAgent = null;
        }
        List<String> imageUrls = [];
        var images = prop['image'] as List<dynamic>;
        images.forEach((img) {
          imageUrls.add(img['guid']);
        });
        var descrip = _parseHtmlString(prop['description']);
        tempFilterProps.add(Property(
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
          description: descrip,
          image: imageUrls,
          date: prop['post_date'],
          phone: prop['phone'],
          agent: tempAgent != null ? tempAgent : null,
          features: tempFeatures,
        ));

        _filterProperties = tempFilterProps;
        print(_filterProperties.length);
        notifyListeners();
      });
    } else {
      print('error in fetching filter properties');
    }
  }

  Future<void> getAgentProperties(String agentId) async {
    List<Property> tempAgentProperty = [];
    final url = Uri.parse('${baseUrl}agent-properties');

    var response = await http.post(url, body: {
      'agent_id': agentId,
    });
    var extractedResponse = json.decode(response.body);
    if (extractedResponse['success'] == true) {
      var data = extractedResponse['data'] as List<dynamic>;
      data.forEach((prop) {
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
        var user = prop['user'];
        Agent? tempAgent;
        if (user != null) {
          tempAgent = Agent(
              id: user['id'].toString(),
              email: user['user_email'],
              name: user['user_nicename'],
              phone: prop['phone']);
        } else {
          tempAgent = null;
        }
        List<String> imageUrls = [];
        var images = prop['image'] as List<dynamic>;
        images.forEach((img) {
          imageUrls.add(img['guid']);
        });
        var descrip = _parseHtmlString(prop['description']);
        tempAgentProperty.add(Property(
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
          description: descrip,
          image: imageUrls,
          date: prop['post_date'],
          phone: prop['phone'],
          agent: tempAgent != null ? tempAgent : null,
          features: tempFeatures,
        ));

        _agentProperties = tempAgentProperty;
        print(_agentProperties.length);
        notifyListeners();
      });
    } else {
      print('error in fetching agent properties');
    }
  }
}
