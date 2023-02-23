// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:mobile_shop/data/tags.dart';
import 'package:mobile_shop/model/cart_item.dart';
import 'package:mobile_shop/page/cart_page.dart';
import 'package:mobile_shop/page/product_page.dart';
import 'package:mobile_shop/provider/shop_provider.dart';
import 'package:mobile_shop/transitions/custom_page_route.dart';
import 'package:mobile_shop/widget/cart_header_widget.dart';
import 'package:provider/provider.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../data/products.dart';
import '../main.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color(0xFFf6f5ee),
        appBar: AppBar(
          title: Text(
            MyApp.title,
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list, color: Colors.black),
              onPressed: () {},
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 1,
          minHeight: 70,
          body: Container(
            margin: EdgeInsets.only(bottom: 150),
            child: Stack(
              children: [
                buildProducts(),
              ],
            ),
          ),
          panelBuilder: (_) => CartPage(),
          collapsed: CartHeaderWidget(),
        ),
      );

  Widget buildProducts() {
    final double spacing = 12;

    return GridView(
      padding: EdgeInsets.all(spacing),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: 3 / 4,
      ),
      children: products
          .map((product) => GestureDetector(
                onTap: () {
                  final provider =
                      Provider.of<ShopProvider>(context, listen: false);
                  //    provider.tag = Tags.imageProducts(product.imgUrl);

                  Navigator.of(context).push(CustomRoute(
                    child: ProductPage(product: product),
                  ));
                },
                child: buildProduct(product),
              ))
          .toList(),
    );
  }

  Widget buildProduct(CartItem product) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Hero(
                    tag: Tags.imageProducts(product.imgUrl),
                    child: Image.asset("assets/cocacola.jpeg"),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${product.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                product.title,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                product.content,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      );
}
