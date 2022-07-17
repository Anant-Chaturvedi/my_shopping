import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'items.dart';

late Size mq;


class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Products'),
          centerTitle: true,
          elevation: 10,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const CartPage()))
                      .then((value) {
                    setState(() {});
                  });
                },
                icon: const Icon(Icons.shopping_cart_rounded, size: 25))
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const CartPage()))
                .then((value) {
              setState(() {});
            });
          },
          label: const Text('Show Cart'),
          icon: const Icon(Icons.shopping_bag),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
            itemCount: itemsList.length,
            itemBuilder: (ctx, i) => ShowItems(product: itemsList[i])));
  }
}
