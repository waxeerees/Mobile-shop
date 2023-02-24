// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mobile_shop/model/cart_item.dart';
/*
class ShopProvider with ChangeNotifier {
  String _tag;
  Map<String, CartItem> _items;

  String get tag => _tag;

  set tag(String tag) {
    _tag = tag;
    notifyListeners();
  }

  ShopProvider() {
    _items = {
      '1': CartItem(
        id: '1',
        title: 'Monster Energy Drink ',
        description:
            'Monster Energy is an energy drink that was introduced by Hansen Natural Company in April of 2002. Monster Energy has a 35% share of the energy drink market, the second highest share after Red Bull.',
        price: 30,
        imgUrl: 'assets/monster.png',
        quantity: 1,
        content: '250ml',
      ),
      '2': CartItem(
        id: '2',
        title: 'Mountain Dew',
        description:
            'Mountain Dew is a carbonated soft drink brand produced and owned by PepsiCo. The original formula was invented in 1940 by Tennessee beverage bottlers Barney and Ally Hartman. A revised formula was created by Bill Bridgforth in 1958.',
        price: 15,
        imgUrl: 'assets/mountdew.png',
        quantity: 2,
        content: '300ml',
      ),
    };
  }

  Map<String, CartItem> get items => _items;

  set items(Map<String, CartItem> value) {
    _items = value;
  }

  int get itemCount => _items.length;

  void addItem({
    CartItem product,
  }) {
    if (items.containsKey(product.id)) {
      items.update(
        product.id,
        (cartItem) => cartItem.copy(quantity: cartItem.quantity + 1),
      );
    } else {
      items.putIfAbsent(
        product.id,
        () => product.copy(
          id: DateTime.now().toString(),
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }
}

*/

class ShopProvider extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  /// The current total price of all items (assuming all items cost $42).
  int get totalPrice => _items.length * 42;

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(CartItem item, {required CartItem product}) {
    _items.add(item);

    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  int getPrice() => totalPrice;

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
