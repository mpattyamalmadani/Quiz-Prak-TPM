import 'package:flutter/material.dart';
import 'package:kuiz/groceries.dart';
import 'list_barang.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Store',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grocery Data"),
        ),
        body: GroceryList(),
      ),
    );
  }
}

