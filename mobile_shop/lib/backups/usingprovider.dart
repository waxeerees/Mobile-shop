import 'package:flutter/material.dart';
import 'package:mobile_shop/data/item_data.dart';
import 'package:mobile_shop/data/item_list.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
          create: (context) => ItemList(), child: const NewHomePage()),
    );
  }
}

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

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
