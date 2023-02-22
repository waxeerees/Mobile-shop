// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'item_data.dart';

class ItemList extends ChangeNotifier {
  List<ItemData> _items = [];

  void addItem(ItemData itemData) {
    _items.add(itemData);
    notifyListeners();
  }

  List<ItemData> get basketItem {
    return _items;
  }
}
