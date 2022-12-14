import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:ijarah/Models/filters.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/filterprop.dart';
import 'package:ijarah/Widget/adaptive_indecator.dart';
import 'package:ijarah/Widget/dropdown.dart';
import 'package:provider/provider.dart';

import '../Widget/appbar.dart';
import '../constant.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isFirst = true;
  bool isLoading = false;
  Filter? filter;
  String selectedCity = '';
  String propType = '';
  double maxPrice = 0.0;
  double minPrice = 0.0;
  var _startingPriceController = TextEditingController();
  var _endPriceController = TextEditingController();
  String purpose = '';
  bool fetching = false;
  RangeValues? _currentRangeValues;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    // if (Provider.of<Filters>(context).isFilter == false) {
    if (isFirst) {
      isFirst = false;
      setState(() {
        isLoading = true;
      });
      await Provider.of<Filters>(context, listen: false).getFilterValues();

      setState(() {
        isLoading = false;
      });
    }
    super.didChangeDependencies();
  }

  void submit() async {
    setState(() {
      fetching = true;
    });
    await Provider.of<Properties>(context, listen: false).getFilterProperties(
      purpose: purpose,
      city: selectedCity,
      type: propType,
      minPrice: _startingPriceController.text.trim(),
      maxPrice: _endPriceController.text.trim(),
    );

    setState(
      () {
        fetching = false;
      },
    );

    Navigator.of(context).pushNamed(FilterPropertyScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    filter = Provider.of<Filters>(context, listen: false).filter;
    var filterValues = Provider.of<Filters>(context).filterValues;

    if (filter != null && maxPrice == 0) {
      maxPrice = double.parse(filter!.maxPrice);
      minPrice = double.parse(filter!.minPrice);
      _startingPriceController =
          TextEditingController(text: minPrice.toStringAsFixed(0));
      _endPriceController =
          TextEditingController(text: maxPrice.toStringAsFixed(0));
      _currentRangeValues = RangeValues(minPrice, maxPrice);
    }

    selectedCity = filterValues['city'];
    purpose = filterValues['purpose'];
    propType = filterValues['propType'];
    minPrice = filterValues['minPrice'];
    maxPrice = filterValues['maxPrice'];

    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    margin: Platform.isAndroid
                        ? const EdgeInsets.only(top: 10)
                        : EdgeInsets.zero,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Appbar(
                        height: height(context),
                        width: width(context),
                        leading: IconButton(
                          icon: Icon(
                            Icons.menu,
                            size: 25,
                            color: primaryColor,
                          ),
                          onPressed: () {},
                        ),
                        center: const Center(
                            child: Text(
                          'Filters',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )),
                        trailing: Text(
                          'sufyan',
                          style: TextStyle(color: primaryColor),
                        )),
                  )
                ],
              ),
              isLoading
                  ? Center(
                      child: AdaptiveIndecator(),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
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
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height(context) * 3,
                                ),
                                const Text(
                                  'New Launching',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      'Filters',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.transparent),
                                    ),
                                    Text(
                                      'Filters',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      'Close',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: height(context) * 1,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: height(context) * 1,
                                ),
                                ListTile(
                                  leading:
                                      const Icon(Icons.check_circle_outline),
                                  title: const Text('I want to'),
                                  trailing: PurposeBox(
                                    selectedIndex: purpose == 'Rentals' ? 0 : 1,
                                    onChanged: (value) {
                                      if (value == 0) {
                                        Provider.of<Filters>(context,
                                                listen: false)
                                            .setFilterValues(
                                                key: 'purpose',
                                                value: 'Rentals');
                                      } else {
                                        Provider.of<Filters>(context,
                                                listen: false)
                                            .setFilterValues(
                                          key: 'purpose',
                                          value: 'Buy',
                                        );
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: height(context) * 1,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: height(context) * 1,
                                ),
                                CityBlock(
                                  selectedCity: selectedCity,
                                  filter: filter!,
                                ),
                                SizedBox(
                                  height: height(context) * 1,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Heading(
                                        icon: Icons.map_outlined,
                                        title: 'Select Locations',
                                      ),
                                      SizedBox(
                                        height: height(context) * 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 6,
                                              child: Container(
                                                height: height(context) * 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    suffixIcon: Icon(
                                                      Icons.search,
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                    ),
                                                    hintText: 'Search Location',
                                                    hintStyle: const TextStyle(
                                                        fontSize: 14),
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 25,
                                                            vertical: 0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: BorderSide(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey
                                                              .withOpacity(0.3),
                                                          width: 1.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: width(context) * 2,
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                height: height(context) * 5,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5,
                                                        horizontal: 5),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.map_outlined,
                                                      color: primaryColor,
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    const Text('Map')
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Heading(
                                    icon: Icons.domain, title: 'Property Type'),
                                SizedBox(
                                  height: height(context) * 1,
                                ),
                                SizedBox(
                                    height: height(context) * 6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: filter!.propertyType.length,
                                      itemBuilder: (ctx, index) => InkWell(
                                        onTap: () {
                                          // setState(() {
                                          //   propType =
                                          //       filter!.propertyType[index];
                                          //   print(propType);
                                          // });
                                          Provider.of<Filters>(context,
                                                  listen: false)
                                              .setFilterValues(
                                                  key: 'propType',
                                                  value: filter!
                                                      .propertyType[index]);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  width: 3,
                                                  color: propType
                                                              .toLowerCase() ==
                                                          filter!.propertyType[
                                                                  index]
                                                              .toLowerCase()
                                                      ? primaryColor
                                                      : Colors.grey
                                                          .withOpacity(0.2),
                                                  style: BorderStyle.solid),
                                            ),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: Center(
                                            child: Text(
                                              filter!.propertyType[index],
                                              style: TextStyle(
                                                  color: propType
                                                              .toLowerCase() ==
                                                          filter!.propertyType[
                                                                  index]
                                                              .toLowerCase()
                                                      ? primaryColor
                                                      : Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Heading(
                                        icon: Icons.sell_outlined,
                                        title: 'Price Range'),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                        'PKR',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                    ),

                                    // CustomDropDown(
                                    //     onChanged: (value) {},
                                    //     items: [
                                    //       'PKR',
                                    //     ])
                                  ],
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: height(context) * 4,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: TextField(
                                          controller: _startingPriceController,
                                          onChanged: (value) {
                                            double v = double.parse(
                                                _startingPriceController.text);
                                            Provider.of<Filters>(context,
                                                    listen: false)
                                                .setFilterValues(
                                                    key: 'minPrice', value: v);
                                          },
                                          decoration: InputDecoration(
                                            hintText: '0',
                                            hintStyle:
                                                const TextStyle(fontSize: 14),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 0),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  width: 1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: Text(
                                          'To',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: height(context) * 4,
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: TextField(
                                          controller: _endPriceController,
                                          onChanged: (value) {
                                            double v = double.parse(
                                                _startingPriceController.text);
                                            Provider.of<Filters>(context,
                                                    listen: false)
                                                .setFilterValues(
                                                    key: 'maxPrice', value: v);
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Any',
                                            hintStyle:
                                                const TextStyle(fontSize: 14),
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 0),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Colors.grey
                                                      .withOpacity(0.3),
                                                  width: 1.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: height(context) * 2,
                                ),
                                StatefulBuilder(
                                  builder: (context, setState) => RangeSlider(
                                    activeColor: primaryColor,
                                    values: _currentRangeValues!,
                                    max: maxPrice,
                                    labels: RangeLabels(
                                      _currentRangeValues!.start
                                          .round()
                                          .toString(),
                                      _currentRangeValues!.end
                                          .round()
                                          .toString(),
                                    ),
                                    onChanged: (RangeValues values) {
                                      setState(() {
                                        _startingPriceController.text = values
                                            .start
                                            .toStringAsFixed(0)
                                            .toString();
                                        _endPriceController.text = values.end
                                            .toStringAsFixed(0)
                                            .toString();
                                        _currentRangeValues = values;
                                      });
                                    },
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  height: height(context) * 1.5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            selectedCity = 'Karachi';
                                            propType = 'Apartments';
                                            _startingPriceController.text =
                                                minPrice.toString();
                                            _endPriceController.text =
                                                maxPrice.toString();
                                            _currentRangeValues =
                                                RangeValues(minPrice, maxPrice);
                                          });
                                        },
                                        child: const Text(
                                          'Clear All',
                                          style: TextStyle(color: Colors.grey),
                                        )),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  primaryColor),
                                        ),
                                        onPressed: submit,
                                        child: Text(fetching
                                            ? 'Searching...'
                                            : 'Search'))
                                  ],
                                ),
                                SizedBox(
                                  height: height(context) * 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  Heading({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(
            width: width(context) * 5,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          )
        ],
      ),
    );
  }
}

class PurposeBox extends StatefulWidget {
  PurposeBox({
    super.key,
    required this.onChanged,
    required this.selectedIndex,
  });

  Function onChanged;
  int selectedIndex;
  @override
  State<PurposeBox> createState() => _PurposeBoxState();
}

class _PurposeBoxState extends State<PurposeBox> {
  @override
  Widget build(BuildContext context) {
    int index = widget.selectedIndex;
    print('yeh sa selected Index $index');
    return Container(
      height: height(context) * 5.5,
      width: width(context) * 34,
      decoration: BoxDecoration(
        border:
            Border.all(color: primaryColor, width: 0, style: BorderStyle.solid),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                index = 0;
                widget.onChanged(0);
              });
            },
            child: Container(
                width: width(context) * 17,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: index == 0 ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(94, 89, 89, 0.11),
                          offset: Offset(0, 10),
                          blurRadius: 20),
                    ]),
                child: Center(
                  child: Text(
                    'Rent',
                    style: TextStyle(
                        color: index == 0 ? Colors.white : headingColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
          InkWell(
            onTap: () {
              setState(() {
                index = 1;
                widget.onChanged(1);
              });
            },
            child: Container(
                width: width(context) * 17,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: index == 1 ? primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Text(
                    'Buy',
                    style: TextStyle(
                        color: index == 1 ? Colors.white : headingColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class CityBlock extends StatefulWidget {
  CityBlock({
    super.key,
    required this.filter,
    required this.selectedCity,
  });

  Filter filter;
  String selectedCity;

  @override
  State<CityBlock> createState() => _CityBlockState();
}

class _CityBlockState extends State<CityBlock> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_outlined),
      title: const Text('City'),
      subtitle: Text(
        widget.selectedCity == '' ? 'Select City' : widget.selectedCity,
        style: TextStyle(color: primaryColor),
      ),
      trailing: Material(
        child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (ctx) => CupertinoAlertDialog(
                        title: const Text('Cities'),
                        content: Column(
                          children: [
                            ...widget.filter.cities
                                .map(
                                  (city) => GestureDetector(
                                    onTap: () {
                                      Provider.of<Filters>(context,
                                              listen: false)
                                          .setFilterValues(
                                              key: 'city', value: city);
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                        width: width(context) * 100,
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(top: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 15),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(
                                              0.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Text(city)),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      ));
            },
            icon: const Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}
