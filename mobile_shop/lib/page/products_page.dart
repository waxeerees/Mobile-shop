// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_local_variable, prefer_const_declarations

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mobile_shop/data/tags.dart';
import 'package:mobile_shop/model/cart_item.dart';
import 'package:mobile_shop/page/cart_page.dart';
import 'package:mobile_shop/page/product_page.dart';
import 'package:mobile_shop/provider/shop_provider.dart';
import 'package:mobile_shop/transitions/custom_page_route.dart';
import 'package:mobile_shop/widget/cart_header_widget.dart';
import 'package:provider/provider.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../main.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/flutter_logo.jpg',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_rounded),
                  title: Text('Profile'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.favorite),
                  title: Text('Favourites'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Color(0xFFf6f5ee),
        appBar: AppBar(
          title: Text(
            MyApp.title,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
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
      ),
    );
  } /* Scaffold(
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
      ); */

  Widget buildProducts() {
    final double spacing = 12;

    return StreamBuilder<List<CartItem>>(
        stream: readProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final productItems = snapshot.data!;
            return GridView(
              padding: EdgeInsets.all(spacing),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 3 / 4,
              ),
              children: productItems
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
          } else {
            return Container();
          }
        });
  }

  Widget buildProductItem(CartItem item) => ListTile(
        title: Text("Item"),
      );

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
                    tag: Tags.imageProducts(product.id),
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

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

Stream<List<CartItem>> readProducts() => FirebaseFirestore.instance
    .collection('products')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => CartItem.fromJson(doc.data())).toList());
