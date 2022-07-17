import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/widgets/theme_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/menu_item.dart';

class MenuItemDetail extends StatelessWidget {
  const MenuItemDetail({Key? key, required this.item}) : super(key: key);

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.arrow_left,
                    size: 40,
                  )),
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage(item.imagePath),
            radius: 120,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(item.itemName,
              style: GoogleFonts.abel(
                fontSize: 28,
              )),
          const SizedBox(
            height: 10,
          ),
          Text('\$${item.price}',
              style: GoogleFonts.abhayaLibre(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xffFA4A0C))),
          const SizedBox(
            height: 50,
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) => ThemeButton(
                text: 'Add to card',
                handleTap: () =>
                    ref.read(cartProvider.notifier).addItem(item.id)),
          )
        ]),
      ),
    );
  }
}
