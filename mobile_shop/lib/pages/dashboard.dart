// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/data/item_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: StreamBuilder<List<ProductItem>>(
          stream: readProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final productItems = snapshot.data!;
              return ListView(
                children: productItems.map(buildProductItem).toList(),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    ));
  }

  Widget buildProductItem(ProductItem item) => ListTile(
        title: Text("Item"),
      );
}

Stream<List<ProductItem>> readProducts() => FirebaseFirestore.instance
    .collection('products')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ProductItem.fromJson(doc.data())).toList());
