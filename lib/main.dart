import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/Screens/home_screen.dart';
import 'package:task1/provider/card_provider.dart';
import 'package:task1/provider/customer_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomerProvider>(
          create: (context) => CustomerProvider(),
        ),
        ChangeNotifierProvider<CardProvider>(
          create: (context) => CardProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
