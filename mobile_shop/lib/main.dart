import 'package:flutter/material.dart';
import 'package:mobile_shop/page/products_page.dart';
import 'package:mobile_shop/provider/shop_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'Shop UI - Drinks';
  final state = ShopProvider();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => state,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(
            primaryColor: Colors.deepOrange,
            primaryColorDark: Colors.white,
            primaryColorLight: Colors.white,
          ),
          home: ProductsPage(), //CartPage(),
        ),
      );
}
