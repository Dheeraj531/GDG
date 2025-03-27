import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../providers/cart_provider.dart';

class CartItemTile extends StatelessWidget {
  final CartItem cartItem;

  CartItemTile({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(cartItem.name),
        subtitle: Text("Quantity: ${cartItem.quantity}"),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () => cartProvider.decreaseQuantity(cartItem.id),
            ),
            Text(cartItem.quantity.toString()),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () => cartProvider.addItem(cartItem),
            ),
          ],
        ),
      ),
    );
  }
}

