import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.label,
      required this.isPassword,
      required this.controller})
      : super(key: key);
  final String label;
  final bool isPassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
            label: Text(
          label,
          style: GoogleFonts.abel(),
        )),
      ),
    );
  }
}
