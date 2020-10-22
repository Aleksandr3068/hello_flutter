import 'package:flutter/material.dart';
import 'package:hello_flutter/models/product.dart';
import 'dart:convert';

import 'package:hello_flutter/pages/item_page.dart';
import 'package:hello_flutter/models/cart.dart';
import 'package:hello_flutter/widgets/bottom_bar.dart';
import 'package:hello_flutter/pages/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Product>> getContactsFromJSON(BuildContext context) async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString("assets/product.json");
    List<dynamic> raw = jsonDecode(jsonString);
    return raw.map((f) => Product.fromJSON(f)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cartData = Cart();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('sportpit.ru', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width / 2 - 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(cartData.totalAmount.toStringAsFixed(2)),
                IconButton(
                  icon: Icon(Icons.shopping_basket, color: Color(0xFF676E79)),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ));
                  },
                ),
                Text(" (" + cartData.quantityProducts.toStringAsFixed(0) + ")",
                    textAlign: TextAlign.start),
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
          future: getContactsFromJSON(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = snapshot.data;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(products[index].name),
                    subtitle: Container(
                      height: 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(products[index].subtitle),
                          Text(
                            '${products[index].price}'.toString() + " р.",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Colors.black12,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            Cart.shared.addItem(products[index]);
                          });
                        }),
                    leading: Image.asset(products[index].image),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(product: products[index])),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      bottomNavigationBar: BottomBar(),
    );
  }
}
