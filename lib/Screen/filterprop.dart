import 'package:flutter/material.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Screen/property_detail.dart';
import 'package:ijarah/constant.dart';
import 'package:provider/provider.dart';

import '../Widget/appbar.dart';

class FilterPropertyScreen extends StatefulWidget {
  static const routeName = 'fil-property';
  const FilterPropertyScreen({super.key});

  @override
  State<FilterPropertyScreen> createState() => _FilterPropertyScreenState();
}

class _FilterPropertyScreenState extends State<FilterPropertyScreen> {
  bool isFirst = true;
  bool isLoading = false;
//   @override
//   void didChangeDependencies() async{
//    if(isFirst){
//     setState(() {
//       isLoading=true;
//     });
//     Provider.of<Properties>(context,listen: false).filterProperties;
// isFirst=false;
//    }
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

  @override
  Widget build(BuildContext context) {
    var properties =
        Provider.of<Properties>(context, listen: false).filterProperties;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
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
                      'Filter Properties',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                    trailing: IconButton(
                      onPressed: () {},
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
                  alignment: Alignment.center,
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
                            const Text(
                              'Filter Properties',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: height(context) * 1.5,
                            ),
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
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
