import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ijarah/Models/agent.dart';
import 'package:ijarah/Models/property.dart';
import 'package:ijarah/Screen/homepage.dart';
import 'package:ijarah/Screen/property_detail.dart';
import 'package:ijarah/Screen/settings.dart';
import 'package:ijarah/Widget/adaptive_indecator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widget/appbar.dart';
import '../constant.dart';

class AgentScreen extends StatefulWidget {
  static const routeName = 'agent-screen';
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  bool isFirst = true;
  bool isLoading = false;
  Agent? agent;

  @override
  void didChangeDependencies() async {
    if (isFirst) {
      setState(() {
        isLoading = true;
      });
      agent = ModalRoute.of(context)!.settings.arguments as Agent;
      await Provider.of<Properties>(context, listen: false)
          .getAgentProperties(agent!.id);
      setState(() {
        isLoading = false;
      });
      // TODO: implement didChangeDependencies
      super.didChangeDependencies();
    }
  }

  @override
  Widget build(BuildContext context) {
    var properties =
        Provider.of<Properties>(context, listen: false).agentProperties;
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        child: SafeArea(
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
                        'Agent Profile',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: height(context) * 86,
                    width: width(context) * 100,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height(context) * 4,
                        ),
                        CircleAvatar(
                          radius: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              'assets/images/person22.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 1,
                        ),
                        Text(
                          agent!.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17),
                        ),
                        SizedBox(
                          height: height(context) * 0.5,
                        ),
                        Text(
                          agent!.email,
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        SizedBox(
                          height: height(context) * 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContactButton(
                              onTap: () async {
                                if (agent!.phone == '') {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => CupertinoAlertDialog(
                                            title: Text('Error'),
                                            content:
                                                Text('Phone number missing'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Okay'))
                                            ],
                                          ));
                                } else {
                                  await launch("tel://${agent!.phone}");
                                }
                              },
                              icon: Icons.call,
                            ),
                            SizedBox(
                              width: width(context) * 3,
                            ),
                            ContactButton(
                              onTap: () async {
                                if (agent!.phone == '') {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) => CupertinoAlertDialog(
                                            title: Text('Error'),
                                            content:
                                                Text('Phone number missing'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Okay'))
                                            ],
                                          ));
                                } else {
                                  await launch('https://wa.me/${agent!.phone}');
                                }
                              },
                              icon: Icons.whatsapp,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height(context) * 1,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: const Text(
                            'Properites :',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: height(context) * 1,
                        ),
                        Expanded(
                          child: isLoading
                              ? Center(
                                  child: AdaptiveIndecator(color: primaryColor),
                                )
                              : properties.isEmpty
                                  ? Center(
                                      child: Text('No Properties to show'),
                                    )
                                  : GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 5.0,
                                        mainAxisSpacing: 10.0,
                                      ),
                                      itemCount: 4,
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
                        ),
                      ],
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
