import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../models/product.dart';

class FarmerScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Farmer: Add Products')),
      body: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Product Name')),
          TextField(controller: priceController, decoration: InputDecoration(labelText: 'Price')),
          ElevatedButton(
            onPressed: () {
              productProvider.addProduct(
                Product(
                  id: DateTime.now().toString(),
                  name: nameController.text,
                  price: double.parse(priceController.text),
                ),
              );
            },
            child: Text('Add Product'),
          ),
        ],
      ),
    );
  }
}

