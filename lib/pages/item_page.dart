import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hello_flutter/models/product.dart';
import 'package:hello_flutter/models/card.dart';
import 'package:hello_flutter/pages/cart_page.dart';
import 'package:hello_flutter/pages/home_page.dart';

class DetailScreen extends StatelessWidget {
  final Todo todo;

  DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          tooltip: 'Navigation menu',
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
        ),
        title: Text(
          todo.name,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
              tag: todo.image,
              child: Container(
                child: Image.asset(todo.bigimage),
                height: 300,
                width: double.infinity,
              ),
            ),
            Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      todo.name + " " + todo.subtitle,
                      style: TextStyle(fontSize: 26.0),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Цена: ',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${todo.price}'.toString() + " р.",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(todo.description),
                    SizedBox(
                      height: 20.0,
                    ),
                    CartDataProvider().cartItems.containsKey(todo)
                        ? Column(
                            children: <Widget>[
                              MaterialButton(
                                  color: Color(0xFFCCFF90),
                                  child: Text('Перейти в корзину'),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => CartPage(),
                                    ));
                                  }),
                              Text(
                                'Товар уже добавлен в корзину',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.blueGrey,
                                ),
                              )
                            ],
                          )
                        : MaterialButton(
                            color: Theme.of(context).primaryColor,
                            child: Text('Добавить в корзину'),
                            onPressed: () {
                              CartDataProvider().addItem(
                                productId: todo.id,
                                image: todo.image,
                                title: todo.name,
                                price: todo.price,
                              );
                            },
                          ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
