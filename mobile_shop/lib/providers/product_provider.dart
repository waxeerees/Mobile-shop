// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;
}
