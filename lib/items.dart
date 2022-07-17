import 'package:flutter/material.dart';

import 'items_page.dart';
import 'model/model.dart';


final itemsList = [
  Items(name: 'I Phone XR', price: '499', image: 'iphone'),
  Items(image: 'bat', name: 'Cricket Bat', price: '999'),
  Items(name: 'Laptop', image: 'laptop', price: '35,465'),
  Items(name: 'Radio', image: 'radio', price: '599')
];

//card for representing single shop item(product) details
class ShowItems extends StatefulWidget {
  const ShowItems({Key? key, required this.product}) : super(key: key);

  final Items product;

  @override
  State<ShowItems> createState() => _ShowItemsState();
}

class _ShowItemsState extends State<ShowItems> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: widget.product.isSelected ? Colors.lightGreenAccent.shade100 : Colors.cyanAccent.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.symmetric(vertical: mq.height * .02),
      child: GestureDetector(
        onTap: () {},
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: Image.asset('assets/images/${widget.product.image}.png'),
          title: Text(
            widget.product.name,
            style:
                const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Rs. ${widget.product.price}.00'),
          trailing: widget.product.isSelected
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.product.isSelected = false;
                    });
                  },
                  icon: const Icon(
                    Icons.done,
                    color: Colors.green,
                    size: 30,
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.product.isSelected = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.redAccent.withOpacity(0.5),
                        action: SnackBarAction(label: 'Okay', onPressed: () {}),
                        content: const Text('Item added to the cart!')));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: const StadiumBorder(),
                      elevation: 5),
                  child: const Text('Add to Cart')),
        ),
      ),
    );
  }
}
