// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:mobile_shop/data/item_data.dart';
import 'package:mobile_shop/data/item_list.dart';
import 'package:provider/provider.dart';

class CartContent extends StatefulWidget {
  const CartContent({super.key});

  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ItemList().basketItem.isEmpty
              ? const Text("No item in the list")
              : ListView.builder(
                  itemCount: ItemList().basketItem.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Text("Title: " + ItemList().basketItem[index].title),
                    );
                  }),
          ElevatedButton(
              onPressed: () {
                /*
                  ItemList.addItem(ItemData(
                      title: DateTime.now().toString(),
                      score: DateTime.now().month,
                      id: "",
                      quantity: 1,
                      imgUrl: "",
                      price: 500,
                      description: "",
                      content: "",
                      category: ""));

                  print("data added successfully" +
                      providerItem.basketItem.length.toString()); */
              },
              child: const Text("Add Data")),
        ],
      ),
    );
  }
}
