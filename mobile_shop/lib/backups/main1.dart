import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/page/products_page.dart';
import 'package:mobile_shop/provider/shop_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShopProvider()),
        // Provider(create: (context) => SomeOtherClass()),
      ],
      child: MyApp(),
    ),
  );
}

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
