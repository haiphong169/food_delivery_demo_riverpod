import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/screens/cart_screen.dart';
import 'package:food_delivery_app/screens/into.dart';
import 'package:food_delivery_app/screens/menu_screen.dart';
import 'package:food_delivery_app/screens/settings.dart';
import 'package:food_delivery_app/screens/signin_signup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery_app/utils/cart.dart';
import 'firebase_options.dart';

final cartProvider =
    StateNotifierProvider<Cart, Map<String, int>>((ref) => Cart());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const IntroScreen(),
      routes: {
        SignInSignUpScreen.routeName: (context) => SignInSignUpScreen(),
        MenuScreen.routeName: (context) => MenuScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        CartScreen.routeName: (context) => CartScreen(),
      },
    );
  }
}
