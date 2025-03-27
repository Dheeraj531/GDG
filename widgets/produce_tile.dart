import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  ProductTile({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
        trailing: ElevatedButton(
          onPressed: onAddToCart,
          child: Text('Add'),
        ),
      ),
    );
  }
}

