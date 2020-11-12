import 'package:flutter/material.dart';
import 'package:hello_flutter/models/product.dart';
import 'package:hello_flutter/pages/favorite_page.dart';
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
    final cartData = Cart.shared;

    return Scaffold(
      appBar: AppBar(
        title: Text('sportpit.ru', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          Container(
              alignment: Alignment.centerRight,
              height: 50.0,
              width: MediaQuery.of(context).size.width / 2 - 100,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              child: Text(cartData.totalAmount.toStringAsFixed(2))),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width / 2 - 150,
                margin: const EdgeInsets.fromLTRB(0.0, 5.0, 25.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.shopping_basket, color: Color(0xFF676E79)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartPage(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 32,
                  bottom: 28,
                  child: Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(cartData.quantityProducts.toStringAsFixed(0),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.amber[900],
                        )),
                  )),
            ],
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
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow[700]),
                accountName: Text('Мистер Твистер'),
                accountEmail: Text("home@dartflutter.ru"),
                currentAccountPicture: Container(
                    child: Image.asset('images/user.png'),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    )),
              ),
            ),
            new ListTile(
                title: new Text("О себе"),
                leading: Icon(Icons.account_box),
                onTap: () {}),
            new ListTile(
                title: new Text("Избранное"),
                leading: Icon(Icons.favorite),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FavoritePage()),
                  );
                }),
            new ListTile(
                title: new Text("Настройки"),
                leading: Icon(Icons.settings),
                onTap: () {}),
            new ListTile(
                title: new Text("Помощь"),
                leading: Icon(Icons.warning_rounded),
                onTap: () {}),
            new ListTile(
                title: new Text("Информация"),
                leading: Icon(Icons.error),
                onTap: () {}),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
