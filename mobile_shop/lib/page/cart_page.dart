// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_shop/model/cart_item.dart';
import 'package:mobile_shop/provider/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Text('Clear Cart'),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: buildCardItems(context),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  '\$80.00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                shape: StadiumBorder(),
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardItems(BuildContext context) {
    final provider = Provider.of<ShopProvider>(context);

    if (provider.items.isEmpty) {
      return Center(
        child: Text(
          'Cart Is Empty',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    } else {
      return ListView(
        physics: BouncingScrollPhysics(),
        children: provider.items.map(buildCardItem).toList(),
      );
    }
  }

  Widget buildCardItem(CartItem cartItem) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/cocacola.jpeg"),
        ),
        title: Row(
          children: [
            Text(
              '${cartItem.quantity}x',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                cartItem.title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        trailing: Text(
          '\$${cartItem.price}',
          style: TextStyle(color: Colors.white),
        ),
      );
}
