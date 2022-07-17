import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/firebaseAuth.dart';
import 'package:food_delivery_app/widgets/text_field.dart';
import 'package:food_delivery_app/widgets/theme_button.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInSignUpScreen extends StatefulWidget {
  const SignInSignUpScreen({Key? key}) : super(key: key);

  static const routeName = '/signinsignup';

  @override
  State<SignInSignUpScreen> createState() => _SignInSignUpScreenState();
}

class _SignInSignUpScreenState extends State<SignInSignUpScreen>
    with FirebaseAuthFunctions {
  bool isSignIn = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _registerEmailController =
      TextEditingController();
  final TextEditingController _registerPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                  bottom: 90,
                  left: 136,
                  child: Image.asset(
                    'assets/images/big_logo.png',
                  ),
                ),
                Positioned(
                    bottom: 14,
                    left: 50,
                    right: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {
                              setState(() {
                                isSignIn = true;
                              });
                            },
                            child: Text('Login',
                                style: GoogleFonts.abel(
                                    fontSize: 18, color: Colors.black))),
                        const SizedBox(
                          width: 90,
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            onPressed: () {
                              setState(() {
                                isSignIn = false;
                              });
                            },
                            child: Text('Sign Up',
                                style: GoogleFonts.abel(
                                    fontSize: 18, color: Colors.black)))
                      ],
                    )),
                isSignIn
                    ? Positioned(
                        bottom: 0,
                        left: 50,
                        child: Container(
                          width: 100,
                          height: 3,
                          color: const Color(0XFFFA4A0C),
                        ))
                    : Positioned(
                        bottom: 0,
                        right: 50,
                        child: Container(
                          width: 100,
                          height: 3,
                          color: const Color(0XFFFA4A0C),
                        ))
              ],
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 40,
            ),
            MyTextField(
                label: 'Email address',
                isPassword: false,
                controller:
                    isSignIn ? _emailController : _registerEmailController),
            const SizedBox(
              height: 30,
            ),
            MyTextField(
                label: 'Password',
                isPassword: true,
                controller: isSignIn
                    ? _passwordController
                    : _registerPasswordController),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.abel(
                      color: const Color(0XFFFA4A0C), fontSize: 17),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ]),
          isSignIn
              ? ThemeButton(
                  text: 'Login',
                  handleTap: () {
                    signIn(_emailController.text, _passwordController.text,
                        context);
                    Timer(const Duration(milliseconds: 1000), () {
                      _emailController.clear();
                      _passwordController.clear();
                    });
                  })
              : ThemeButton(
                  text: 'Sign Up',
                  handleTap: () {
                    createNewUser(_registerEmailController.text,
                        _registerPasswordController.text, context);
                    Timer(const Duration(milliseconds: 1000), () {
                      _registerEmailController.clear();
                      _registerPasswordController.clear();
                    });
                  })
        ]),
      ),
    );
  }
}
