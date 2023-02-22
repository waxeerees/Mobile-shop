// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/item_data.dart';
import '../data/item_list.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key, required String id}) : super(key: key);

  @override
  _NewHomePageState createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemList>(builder: (context, providerItem, child) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0XFF2e3438),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              providerItem.basketItem.isEmpty
                  ? const Text("No item in the list")
                  : ListView.builder(
                      itemCount: providerItem.basketItem.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Title: " + providerItem.basketItem[index].title),
                        );
                      }),
              ElevatedButton(
                  onPressed: () {
                    providerItem.addItem(ItemData(
                        title: DateTime.now().toString(),
                        score: DateTime.now().month,
                        id: "",
                        quantity: 1,
                        imgUrl: "",
                        price: 500,
                        description: "",
                        content: "",
                        category: ""));

                    print("data added successfully" +
                        providerItem.basketItem.length.toString());
                  },
                  child: const Text("Add Data")),
            ],
          ));
    });
  }
}
/*
class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required String id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemList>(builder: (context, providerItem, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: buildProduct(context),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildProduct(BuildContext context) {
    // final tag = Provider.of<ShopProvider>(context).tag;

    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            child: Hero(
              //  flightShuttleBuilder: buildShuttle,
              tag: "tag",
              child: Image.asset("assets/cocacola.jpeg", fit: BoxFit.cover),
            ),
          ),
        ),
        buildTexts(),
        SizedBox(height: 24),
        Container(
          height: 50,
          width: 200,
          child: RaisedButton(
            shape: StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              providerItem.addItem(ItemData(
                title: DateTime.now().toString(),
                score: DateTime.now().month,
                id: "",
                quantity: 1,
                imgUrl: "",
                price: 500,
                description: "",
                content: "",
                category: "",
              ));
              print("data added successfully" +
                  providerItem.basketItem.length.toString());

              /*      final provider =
                  Provider.of<ShopProvider>(context, listen: false);

              provider.tag = Tags.imageCart(product.imgUrl);
              provider.addItem(product: product, quantity: quantity);
            */
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildTexts() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //  product.title,
              "Title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(height: 12),
            Text(
              //    product.content,
              "Quantity",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuiltQuatity(),
                Text(
                  //   '\$${product.price.toStringAsFixed(2)}',
                  "Price",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 32),
            Text(
              'About The Product',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 18),
            Text(
              //  product.description,
              "Description",
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ],
        ),
      );
}

class BuiltQuatity extends StatefulWidget {
  const BuiltQuatity({super.key});

  @override
  State<BuiltQuatity> createState() => _BuiltQuatityState();
}

int quantity = 1;

class _BuiltQuatityState extends State<BuiltQuatity> {
  final style = TextStyle(fontWeight: FontWeight.bold, fontSize: 22);

  @override
  void initState() {
    super.initState();
    quantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        border: Border.all(color: Colors.black26),
      ),
      child: Row(
        children: [
          MaterialButton(
            minWidth: 60,
            child: Text('—', style: style),
            onPressed: () {
              setState(() {
                if (quantity > 1) {
                  quantity = quantity - 1;
                } else {
                  quantity = 1;
                }
              });
            },
          ),
          Text(quantity.toString(), style: style),
          MaterialButton(
            minWidth: 60,
            child: Text('+', style: style),
            onPressed: () {
              setState(() {
                quantity = quantity + 1;
              });
            },
          ),
        ],
      ),
    );
  }
} */
