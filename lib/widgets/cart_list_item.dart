import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/utils/foodList.dart';
import 'package:food_delivery_app/widgets/menu_item.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends ConsumerWidget {
  CartItem({Key? key, required this.id}) : super(key: key);

  final String id;

  MenuItem getItemWithId() {
    for (var element in foodList) {
      if (element.id == id) {
        return element;
      }
    }
    return MenuItem(imagePath: '', itemName: '', price: 0, id: '');
  }

  late final item = getItemWithId();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.read(cartProvider.notifier);

    return Dismissible(
      key: Key(item.id),
      onDismissed: (_) {
        cartNotifier.removeItem(item.id);
      },
      child: Container(
        height: 100,
        width: 300,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(item.imagePath),
            radius: 35,
          ),
          title: Text(
            item.itemName,
            style: GoogleFonts.abel(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          subtitle: Text(
            '\$${item.price}',
            style: GoogleFonts.abel(color: const Color(0xFFFA4A0C)),
          ),
          trailing: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFFA4A0C),
                  borderRadius: BorderRadius.circular(30)),
              height: 65,
              width: 120,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => cartNotifier.substractItem(id),
                    child: Text(
                      '-',
                      style:
                          GoogleFonts.abel(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      ref.watch(cartProvider)[id].toString(),
                      style:
                          GoogleFonts.abel(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cartNotifier.addItem(id);
                    },
                    child: Text(
                      '+',
                      style:
                          GoogleFonts.abel(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
