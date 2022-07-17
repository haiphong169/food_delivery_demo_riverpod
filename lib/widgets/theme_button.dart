import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key, required this.text, required this.handleTap})
      : super(key: key);
  final String text;
  final VoidCallback handleTap;

  void hello() {
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 300,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0XFFFA4A0C)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))),
          onPressed: handleTap,
          child: Text(text,
              style: GoogleFonts.abel(
                fontSize: 17,
              ))),
    );
  }
}
