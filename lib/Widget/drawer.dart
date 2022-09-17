// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../Screen/Admin/users/customers.dart';
// import '../Screen/Auth/Login/login.dart';
// import '../contant.dart';

// class AppDrawer extends StatefulWidget {
//   const AppDrawer({Key? key}) : super(key: key);

//   @override
//   State<AppDrawer> createState() => _AppDrawerState();
// }

// class _AppDrawerState extends State<AppDrawer> {
//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var mediaQuery = MediaQuery.of(context).size;
//     var height = mediaQuery.height / 100;
//     var width = mediaQuery.width / 100;
//     var currentUser = Provider.of<Auth>(context).currentUser;
//     // String? userName = Provider.of<Auth>(context).name;
//     // String? userEmail = Provider.of<Auth>(context).userEmail;

//     Orientation currentOrientation = MediaQuery.of(context).orientation;

//     return SafeArea(
//       child: ClipRRect(
//         borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
//         child: Container(
//           decoration: BoxDecoration(gradient: customGradient),
//           child: Drawer(
//             backgroundColor: Colors.transparent,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Stack(
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(60),
//                         ),
//                         child: Image.asset(
//                           'assets/images/poster.jpeg',
//                           height: height * 24.5,
//                           width: width * 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black.withOpacity(0.8),
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(60),
//                           ),
//                         ),
//                         height: height * 24.5,
//                         width: width * 100,
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 30, vertical: 30),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 InkWell(
//                                     onTap: () {
//                                       print('line 66');
//                                     },
//                                     child: Container(
//                                       alignment: Alignment.centerLeft,
//                                       height: currentOrientation ==
//                                               Orientation.landscape
//                                           ? height * 12
//                                           : height * 6,
//                                       width: currentOrientation ==
//                                               Orientation.landscape
//                                           ? height * 12
//                                           : height * 15,
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(30),
//                                         image: const DecorationImage(
//                                           fit: BoxFit.contain,
//                                           image: AssetImage(
//                                               'assets/images/logo.png'),
//                                         ),
//                                       ),
//                                     )),
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.of(context).pop();
//                                   },
//                                   child: Icon(
//                                     Icons.menu_open_outlined,
//                                     color: primaryColor,
//                                     size: 30,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             // if (currentUser != null)
//                             Text(
//                               currentUser!.name!,
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline5!
//                                   .copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white.withOpacity(0.8),
//                                   ),
//                             ),
//                             SizedBox(
//                               height: height * 0,
//                             ),
//                             // if (currentUser != null)
//                             Text(
//                               currentUser.email,
//                               style: TextStyle(
//                                 color: Colors.white.withOpacity(0.8),
//                                 fontSize: 14,
//                               ),
//                             ),
//                             SizedBox(
//                               height: height * 1,
//                             ),
//                             // if (currentUser != null)
//                             Text(
//                               currentUser.role!,
//                               style: TextStyle(
//                                 color: btnbgColor.withOpacity(0.8),
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Divider(),
//                   ListTile(
//                     leading: const Icon(
//                       Icons.home_outlined,
//                       color: Colors.white,
//                     ),
//                     title: const Text(
//                       'Home',
//                       style: TextStyle(
//                           fontFamily: 'Poppins-thin',
//                           fontSize: 16,
//                           color: Colors.white),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       Provider.of<Counts>(context, listen: false)
//                           .setSelectedIndex(0);
//                     },
//                   ),
//                   if (currentUser.role!.toLowerCase() == 'admin')
//                     const Divider(),
//                   if (currentUser.role!.toLowerCase() == 'admin')
//                     ListTile(
//                       leading: const Icon(
//                         Icons.home_outlined,
//                         color: Colors.white,
//                       ),
//                       title: const Text(
//                         'Customer',
//                         style: TextStyle(
//                             fontFamily: 'Poppins-thin',
//                             fontSize: 16,
//                             color: Colors.white),
//                       ),
//                       onTap: () {
//                         Navigator.of(context).pop();
//                         Navigator.of(context)
//                             .pushNamed(CustomerScreen.routeName);
//                       },
//                     ),
//                   const Divider(),
//                   ListTile(
//                     leading: const Icon(
//                       Icons.logout,
//                       color: Colors.white,
//                     ),
//                     title: const Text(
//                       'Logout',
//                       style: TextStyle(
//                           fontFamily: 'Poppins-thin',
//                           fontSize: 16,
//                           color: Colors.white),
//                     ),
//                     onTap: () {
//                       showDialog(
//                           context: context,
//                           builder: (ctx) => AdaptiveDiaglog(
//                                 ctx: ctx,
//                                 title: 'Logout',
//                                 content: 'Are you sure?',
//                                 btnYes: 'Yes',
//                                 btnNO: 'No',
//                                 yesPressed: () async {
//                                   print('logout');
//                                   await Provider.of<Auth>(context,
//                                           listen: false)
//                                       .logout();
//                                   Navigator.of(context).pushReplacementNamed(
//                                       LoginScreen.routeName);
//                                 },
//                                 noPressed: () {
//                                   Navigator.of(ctx).pop();
//                                 },
//                               ));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
