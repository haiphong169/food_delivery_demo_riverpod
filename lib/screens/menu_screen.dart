import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/settings.dart';
import 'package:food_delivery_app/utils/firebaseAuth.dart';
import 'package:food_delivery_app/widgets/menu_item.dart';
import 'package:food_delivery_app/widgets/theme_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/foodList.dart';
import 'cart_screen.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key}) : super(key: key);

  static const routeName = '/menu';

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> with FirebaseAuthFunctions {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              height: 300,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pushNamed(
                                context, SettingsScreen.routeName),
                            icon: const Icon(Icons.menu)),
                        IconButton(
                            onPressed: () => Navigator.pushNamed(
                                context, CartScreen.routeName),
                            icon: const Icon(Icons.shopping_cart)),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Delicious\nfood for you',
                      style: GoogleFonts.abhayaLibre(
                          fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFEFEEEE),
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Search',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none)),
                    )
                  ]),
            ),
            const SizedBox(
              height: 30,
            ),
            DefaultTabController(
              length: 4,
              initialIndex: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  TabBar(
                    tabs: [
                      Tab(
                          child: Text(
                        'Foods',
                        style: GoogleFonts.abel(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )),
                      Tab(
                        child: Text(
                          'Drinks',
                          style: GoogleFonts.abel(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Snacks',
                          style: GoogleFonts.abel(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Sauce',
                          style: GoogleFonts.abel(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 330,
                    child: TabBarView(children: [
                      ListView(
                        padding: const EdgeInsets.only(left: 20),
                        children: foodList,
                        scrollDirection: Axis.horizontal,
                      ),
                      const Text('hihi'),
                      const Text('hihi'),
                      const Text('hihi'),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      color: ModalRoute.of(context)?.settings.name ==
                              MenuScreen.routeName
                          ? const Color(0xFFFA4A0C)
                          : const Color(0xFFADADAF),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.heart,
                        color: Color(0xFFADADAF))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.person,
                        color: Color(0xFFADADAF))),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.history, color: Color(0xFFADADAF))),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
