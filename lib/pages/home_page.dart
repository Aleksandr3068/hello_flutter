import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:hello_flutter/pages/item_page.dart';
import 'package:hello_flutter/models/card.dart';
import 'package:hello_flutter/widgets/bottom_bar.dart';
import 'package:hello_flutter/pages/cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

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
              mainAxisAlignment: MainAxisAlignment.end,
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
              ],
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text("Loading..."),
              ),
            );
          } else {
            final showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: showData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(showData[index]['name']),
                  subtitle: Container(
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(showData[index]['subtitle']),
                        IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Colors.black12,
                              size: 30,
                            ),
                            onPressed: () {
                              Provider.of<CartDataProvider>(context,
                                      listen: false)
                                  .addItem(
                                productId: showData[index]['id'],
                                price: showData[index]['price'],
                                title: showData[index]['name'],
                                image: showData[index]['image'],
                              );
                            })
                      ],
                    ),
                  ),
                  trailing: Text(
                    '${showData[index]['price']}'.toString() + " р.",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  leading: Image.asset(showData[index]['image']),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(todo: showData[index]['id'])),
                    );
                  },
                );
              },
            );
          }
        },
        future:
            DefaultAssetBundle.of(context).loadString("assets/product.json"),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
