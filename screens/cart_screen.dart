import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cartProvider.items.isEmpty
          ? Center(child: Text('No items in cart'))
          : Column(
        children: [
          Expanded(
            child: ListView(
              children: cartProvider.items.values.map((cartItem) {
                return CartItemTile(cartItem: cartItem);
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              child: Text('Proceed to Payment'),
            ),
          ),
        ],
      ),
    );
  }
}

