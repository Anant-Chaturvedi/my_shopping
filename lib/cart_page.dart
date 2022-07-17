import 'package:flutter/material.dart';

import 'items.dart';
import 'items_page.dart';

bool isAdded = false;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Shopping Cart'),
          centerTitle: true,
          elevation: 10,
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {},
          label: const Text('Place Order'),
          icon: const Icon(Icons.shopping_cart_checkout_sharp),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            itemCount:
                itemsList.where((s) => s.isSelected == true).toList().length,
            itemBuilder: (ctx, i) => ShowItems(
                product:
                    itemsList.where((e) => e.isSelected == true).toList()[i])));
  }
}
