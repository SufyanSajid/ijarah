import 'package:flutter/material.dart';

import '../Widget/appbar.dart';
import '../constant.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
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
                        'CONTACT GOTIJARAH',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      )),
                      trailing: Text(
                        'sufyan',
                        style: TextStyle(color: primaryColor),
                      )),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  height: height(context) * 79,
                  width: width(context) * 100,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddressBlock(
                        title: 'Office',
                        address: '#101, Haryani Square, Phase 5, Near KFC, ',
                        city: 'DHA, Karachi.',
                        phone: '+92 334 2577 357',
                      ),
                      SizedBox(
                        height: height(context) * 6,
                      ),
                      AddressBlock(
                        title: 'Abu Dhabi',
                        address: '#101, Haryani Square, Phase 5, Near KFC, ',
                        city: 'DHA, Karachi.',
                        phone: '+92 334 2577 357',
                      ),
                      SizedBox(
                        height: height(context) * 6,
                      ),
                      AddressBlock(
                        title: 'Dubai Office',
                        address: '#101, Haryani Square, Phase 5, Near KFC, ',
                        city: 'DHA, Karachi.',
                        phone: 'info@gotijarah.pk',
                      ),
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

class AddressBlock extends StatelessWidget {
  AddressBlock({
    Key? key,
    required this.title,
    required this.address,
    required this.city,
    required this.phone,
  }) : super(key: key);
  String title;
  String address;
  String city;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          address,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          city,
          style: TextStyle(fontSize: 16),
        ),
        Text(
          phone,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
