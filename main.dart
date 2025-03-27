import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import 'screens/role_selection_screen.dart';
import 'screens/farmer_screen.dart';
import 'screens/customer_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';

void main() {
  runApp(const FarmerApp());
}

class FarmerApp extends StatelessWidget {
  const FarmerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Farmer Market App',
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (context) => RoleSelectionScreen(),
          '/farmer': (context) => FarmerScreen(),
          '/customer': (context) => CustomerScreen(),
          '/cart': (context) => CartScreen(),
          '/payment': (context) => PaymentScreen(),
        },
      ),
    );
  }
}
