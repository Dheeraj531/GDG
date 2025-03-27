import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    double totalAmount = cartProvider.items.values.fold(
      0.0,
          (sum, item) => sum + (item.price * item.quantity),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Payment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total: \$${totalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                cartProvider.clearCart();
                Navigator.popUntil(context, ModalRoute.withName('/customer'));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment Successful!')));
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

