import 'package:flutter/material.dart';
import 'package:ijarah/Widget/input_feild.dart';
import 'package:ijarah/Widget/submitbutton.dart';

import '../../Widget/appbar.dart';
import '../../constant.dart';

class SignUpScreen extends StatelessWidget {
  static const routename = 'sign-up';
  SignUpScreen({super.key});

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Appbar(
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
                      'SignUp',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                    trailing: Text(
                      'sufyan',
                      style: TextStyle(color: primaryColor),
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: height(context) * 85,
                  width: width(context) * 100,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height(context) * 6,
                      ),
                      Text(
                        'Create your account',
                        style: TextStyle(
                            color: headingColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      SizedBox(
                        width: width(context) * 65,
                        child: const Text(
                          'After your registration is complete,you can see our opportunity products',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height(context) * 3,
                            ),
                            InputFeild(
                                hinntText: 'Username',
                                validatior: () {},
                                inputController: _usernameController),
                            SizedBox(
                              height: height(context) * 2.5,
                            ),
                            InputFeild(
                                hinntText: 'Email',
                                validatior: () {},
                                inputController: _emailController),
                            SizedBox(
                              height: height(context) * 2.5,
                            ),
                            InputFeild(
                                hinntText: 'Password',
                                validatior: () {},
                                inputController: _passController),
                            SizedBox(
                              height: height(context) * 2.5,
                            ),
                            InputFeild(
                                hinntText: 'Phone',
                                validatior: () {},
                                inputController: _passController),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height(context) * 6,
                      ),
                      SubmitButton(
                          height: height(context),
                          width: width(context),
                          onTap: () {},
                          title: 'Sign Up')
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
