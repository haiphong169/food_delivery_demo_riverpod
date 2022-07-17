import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/signin_signup.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF4B3A),
      body: Stack(
        children: [
          Positioned(
            top: 56,
            left: 49,
            child: CircleAvatar(
              radius: 36,
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned(
            left: 51,
            top: 140,
            child: Text(
              'Food for \neveryone',
              style: GoogleFonts.abel(fontSize: 65, color: Colors.white),
            ),
          ),
          Positioned(
              bottom: 125,
              right: 0,
              child: Image.asset('assets/images/male_face.png')),
          Positioned(
              bottom: 95, child: Image.asset('assets/images/female_face.png')),
          Positioned(
              bottom: 55,
              right: 0,
              child: Image.asset('assets/images/top_right_filler.png')),
          Positioned(
              bottom: 55,
              child: Image.asset('assets/images/top_left_filler.png')),
          Positioned(
              bottom: 47,
              right: 0,
              child: Image.asset('assets/images/bottom_filler.png')),
          Positioned(
            bottom: 36,
            left: 50,
            right: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)))),
                onPressed: () =>
                    Navigator.pushNamed(context, SignInSignUpScreen.routeName),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'Get Started!',
                    style: GoogleFonts.abel(
                        fontSize: 17, color: const Color(0XFFFA4A0C)),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
