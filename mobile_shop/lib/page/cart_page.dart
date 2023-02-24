// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_shop/model/cart_item.dart';
import 'package:mobile_shop/provider/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    return Scaffold(
      backgroundColor: Color(0xFFf6f5ee),
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
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 32,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Provider.of<ShopProvider>(context, listen: false)
                        .removeAll();
                  },
                  textColor: Color.fromARGB(255, 136, 0, 0),
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
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                ),
                Consumer<ShopProvider>(builder: (context, cart, child) {
                  if (cart.items.isEmpty) {
                    return Text(
                      formatCurrency.format(0.00),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    );
                  } else {
                    var totalPrice = 0.00;
                    for (var item in cart.items) {
                      totalPrice += item.price * item.quantity;
                    }

                    return Text(
                      '${formatCurrency.format(totalPrice)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    );
                  }
                }),
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
    return Consumer<ShopProvider>(builder: (context, cart, child) {
      return ListView(
        physics: BouncingScrollPhysics(),
        children: cart.items.map(buildCardItem).toList(),
      );
    });
  }

  Widget buildCardItem(CartItem cartItem) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/cocacola.jpeg"),
        ),
        title: Row(
          children: [
            Text(
              '${cartItem.quantity}x',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                cartItem.title,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
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
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      );
}
