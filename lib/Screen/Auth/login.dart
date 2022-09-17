import 'package:flutter/material.dart';
import 'package:ijarah/Screen/Auth/sign_up.dart';
import 'package:ijarah/Widget/appbar.dart';
import 'package:ijarah/Widget/input_feild.dart';
import 'package:ijarah/Widget/submitbutton.dart';
import 'package:ijarah/constant.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'Login-screem';

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passController = TextEditingController();
  bool isChecked = false;

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
                      'Login',
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
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: height(context) * 85,
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
                        height: height(context) * 8,
                      ),
                      Text(
                        'Let’s sign you in',
                        style: TextStyle(
                            color: headingColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height(context) * 1,
                      ),
                      const Text(
                        'Welcome back, you’ve been missed!',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: height(context) * 6,
                      ),
                      InputFeild(
                          hinntText: 'Username or Email',
                          validatior: () {},
                          inputController: _emailController),
                      SizedBox(
                        height: height(context) * 4,
                      ),
                      InputFeild(
                          hinntText: 'Password',
                          validatior: () {},
                          inputController: _passController),
                      SizedBox(
                        height: height(context) * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Checkbox(
                                fillColor: MaterialStateProperty.resolveWith(
                                    (states) => primaryColor),
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height(context) * 5,
                      ),
                      SubmitButton(
                          height: height(context),
                          width: width(context),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routename);
                          },
                          title: 'Login')
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
