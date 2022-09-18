import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:ijarah/Models/appdata.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/contact.dart';
import 'package:ijarah/Screen/latest.dart';
import 'package:ijarah/Screen/launcing.dart';
import 'package:ijarah/Screen/property_detail.dart';
import 'package:ijarah/Screen/settings.dart';
import 'package:ijarah/Widget/adaptive_indecator.dart';
import 'package:ijarah/Widget/appbar.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';

import '../Widget/bottombar.dart';
import 'filters.dart';

class Homepage extends StatefulWidget {
  static const routeName = 'home-page';
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int? selectedIndex;
  bool isLoading = false;
  bool isFirst = false;
  List<Property> launchProp = [];
  List<Property> latestProp = [];
  List<String> categories = [];

  @override
  void didChangeDependencies() async {
    print(123);
    // if(isFirst){
    if (Provider.of<Properties>(context, listen: false).newLaunching.isEmpty) {
      setState(() {
        isLoading = true;
      });
      await Provider.of<Properties>(context, listen: false)
          .fetchAndSetProperties();
      setState(() {
        isLoading = false;
      });
    }
    //   isFirst=false;
    // }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // var properties = Provider.of<Properties>(context, listen: false).properties;
    launchProp = Provider.of<Properties>(context, listen: false).newLaunching;
    latestProp =
        Provider.of<Properties>(context, listen: false).latestProperties;
    String banner = Provider.of<Properties>(context, listen: false).banner;
    categories = Provider.of<Properties>(context, listen: false).catgeories;
    Widget homePage = SafeArea(
      bottom: false,
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
                      'Explore Properties',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: height(context) * 79.5,
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
                    children: [
                      SizedBox(
                        height: height(context) * 2,
                      ),
                      TitleRow(
                        title: 'New Launching',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(NewLauncingScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      SizedBox(
                        height: height(context) * 24,
                        child: isLoading
                            ? Center(
                                child: AdaptiveIndecator(color: primaryColor),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: launchProp.length,
                                itemBuilder: (ctx, index) => InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        PropertyDetailScreen.routeName,
                                        arguments: launchProp[index]);
                                  },
                                  child: PropertyWidget(
                                    property: launchProp[index],
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: height(context) * 1.5,
                      ),
                      if (banner.isNotEmpty && isLoading == false)
                        Image.network(
                          banner,
                          height: height(context) * 9,
                          width: width(context) * 100,
                          fit: BoxFit.contain,
                        ),
                      SizedBox(
                        height: height(context) * 1.5,
                      ),
                      TitleRow(
                        title: 'Latest Properties',
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(LatestScreen.routeName);
                        },
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      SizedBox(
                        height: height(context) * 24,
                        child: isLoading
                            ? Center(
                                child: AdaptiveIndecator(color: primaryColor),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: latestProp.length,
                                itemBuilder: (ctx, index) => InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        PropertyDetailScreen.routeName,
                                        arguments: latestProp[index]);
                                  },
                                  child: PropertyWidget(
                                    property: latestProp[index],
                                  ),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      SizedBox(
                          height: height(context) * 8,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (ctx, index) => QuickLink(
                              icon: Icons.home,
                              title: categories[index],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    List<Widget> _tabs = [
      homePage,
      FilterScreen(),
      ContactScreen(),
      SettingScreen(),
    ];
    selectedIndex = Provider.of<App>(context).bottomBarIndex;

    return Scaffold(
        bottomNavigationBar: CustomBottomBar(
          selectedIndex: selectedIndex!,
        ),
        backgroundColor: primaryColor,
        body: _tabs[selectedIndex!]);
  }
}

class QuickLink extends StatelessWidget {
  QuickLink({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  IconData icon;
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 20,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: height(context) * 3,
          ),
          SizedBox(
            height: height(context) * 0.2,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class PropertyWidget extends StatelessWidget {
  PropertyWidget({
    Key? key,
    required this.property,
  }) : super(key: key);

  Property property;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context) * 50,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Colors.grey.withOpacity(0.5),
              width: 1.5,
              style: BorderStyle.solid)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 10,
            child: ExtendedImage.network(
              property.image,
              cache: true,
              width: width(context) * 50,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: height(context) * 0.5,
                ),
                Text(
                  property.price,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Text(
                  property.address,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 11,
                      color: contentColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: height(context) * 0.0,
                ),
                Text(
                  'House for ${property.purpose}',
                  style: TextStyle(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    Attribute(
                      icon: Icons.area_chart,
                      value: property.area,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Attribute(
                      icon: Icons.bed,
                      value: property.bed,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Attribute(
                      icon: Icons.bathroom_outlined,
                      value: property.bath,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Attribute extends StatelessWidget {
  Attribute({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  IconData icon;
  String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class TitleRow extends StatelessWidget {
  TitleRow({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  String title;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'See All >>',
            style: TextStyle(color: primaryColor),
          ),
        )
      ],
    );
  }
}
