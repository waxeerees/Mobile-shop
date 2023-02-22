// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/data/item_data.dart';
import 'package:mobile_shop/data/item_list.dart';
import 'package:mobile_shop/pages/ViewProduct.dart';
import 'package:mobile_shop/widgest/cart_content.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ProductsSlidePanel()));
  }

  Widget buildProductItem(ProductItem product) => Container(
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
                    tag: 'dash',
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

Stream<List<ProductItem>> readProducts() => FirebaseFirestore.instance
    .collection('products')
    .snapshots()
    .map((snapshot) =>
        snapshot.docs.map((doc) => ProductItem.fromJson(doc.data())).toList());

class ProductsSlidePanel extends StatefulWidget {
  const ProductsSlidePanel({super.key});

  @override
  State<ProductsSlidePanel> createState() => _ProductsSlidePanelState();
}

class _ProductsSlidePanelState extends State<ProductsSlidePanel> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        renderPanelSheet: false,
        panel: _floatingPanel(),
        collapsed: _floatingCollapsed(),
        body: StreamBuilder<List<ProductItem>>(
            stream: readProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final productItems = snapshot.data!;
                return GridView(
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 4,
                  ),
                  children: productItems
                      .map((product) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NewHomePage(id: ""),
                                ),
                              );
                            },
                            child: buildProductItem(product),
                          ))
                      .toList(),
                  // children: productItems.map(buildProductItem).toList(),
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }

  Widget buildProductItem(ProductItem product) => Container(
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
                    tag: product.id,
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

  Widget _floatingCollapsed() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "Cart Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _floatingPanel() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.grey,
            ),
          ]),
      margin: const EdgeInsets.all(24.0),
      child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            children: [
              Expanded(
                child: Text(ItemList().basketItem.length.toString()),
                //  child: CartContent(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 48, 40, 40), fontSize: 18),
                  ),
                  //   BuiltTotal()
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
          )),
    );
  }
}
