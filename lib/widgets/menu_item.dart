import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/menu_item_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.imagePath,
      required this.itemName,
      required this.price,
      required this.id})
      : super(key: key);

  final String imagePath;
  final String itemName;
  final double price;
  final String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => MenuItemDetail(item: this))),
      child: SizedBox(
        width: 200,
        child: Card(
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 10),
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 80,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(itemName,
                style: GoogleFonts.abel(
                  fontSize: 22,
                )),
            const SizedBox(
              height: 10,
            ),
            Text('\$$price',
                style: GoogleFonts.abhayaLibre(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFA4A0C))),
            const SizedBox(
              height: 20,
            )
          ]),
        ),
      ),
    );
  }
}
