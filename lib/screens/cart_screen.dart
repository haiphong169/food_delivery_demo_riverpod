import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/utils/cart.dart';
import 'package:food_delivery_app/widgets/cart_list_item.dart';
import 'package:food_delivery_app/widgets/theme_button.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/cart';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, int> cart = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F8),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_left,
                        size: 40,
                      )),
                  Text('Cart',
                      style: GoogleFonts.abel(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
              if (cart.isEmpty)
                Expanded(
                  child: const Center(
                    child: Text('Order something'),
                  ),
                )
              else
                Expanded(
                  child: ListView(
                    children: cart.entries.map((e) {
                      return CartItem(
                        id: e.key,
                      );
                    }).toList(),
                  ),
                ),
              ThemeButton(
                  text: 'Complete Order',
                  handleTap: () => ref.read(cartProvider.notifier).removeAll())
            ],
          )),
    );
  }
}
