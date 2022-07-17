import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/firebaseAuth.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget with FirebaseAuthFunctions {
  SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFA4A0C),
      body: Stack(
        children: [
          Positioned(
              left: 40,
              top: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingItem(
                      const ImageIcon(
                        AssetImage('assets/icons/profile.png'),
                        color: Colors.white,
                      ),
                      'Profile'),
                  SettingItem(
                      const ImageIcon(AssetImage('assets/icons/orders.png'),
                          color: Colors.white),
                      'Orders'),
                  SettingItem(
                      const ImageIcon(AssetImage('assets/icons/offer.png'),
                          color: Colors.white),
                      'Offers'),
                  SettingItem(
                      const ImageIcon(AssetImage('assets/icons/privacy.png'),
                          color: Colors.white),
                      'Privacy Policy'),
                  SettingItem(
                      const ImageIcon(AssetImage('assets/icons/security.png'),
                          color: Colors.white),
                      'Security'),
                ],
              )),
          Positioned(
              right: 0,
              top: 207,
              child: Image.asset('assets/images/blurred_sample_screen.png')),
          Positioned(
              right: 0,
              top: 156,
              child: Image.asset('assets/images/sample_screen.png')),
          Positioned(
              left: 40,
              bottom: 90,
              child: InkWell(
                onTap: () => signOut(),
                child: Text(
                  'Sign Out',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )),
          const Positioned(
              left: 130,
              bottom: 90,
              child: ImageIcon(
                AssetImage('assets/icons/arrow_right.png'),
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

Widget SettingItem(ImageIcon icon, String settingName) {
  return Container(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          icon,
          const SizedBox(
            width: 15,
          ),
          Text(
            settingName,
            style: GoogleFonts.poppins(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      ),
      const SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Container(
          height: 1,
          width: 125,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 7,
      )
    ]),
  );
}
