import 'package:flutter/material.dart';

import 'package:hello_flutter/models/cart.dart';
import 'package:hello_flutter/pages/item_page.dart';
import 'package:hello_flutter/pages/home_page.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartData = Cart();
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
          title: Text('Корзина'),
        ),
        body: cartData.cartItems.isEmpty
            ? Card(
                elevation: 5.0,
                margin: const EdgeInsets.all(30.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Корзинка пустая ;(',
                  ),
                ),
              )
            : Column(
                children: <Widget>[
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {});
                          cartData.clear();
                        },
                        color: Theme.of(context).primaryColor,
                        child: Text('Купить'),
                      ),
                    ],
                  ),
                  Divider(),
                  Expanded(
                      child: Container(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(15.0),
                        itemCount: cartData.cartItemsCount,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              key: ValueKey(
                                  cartData.cartItems.keys.toList()[index]),
                              background: Container(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                  size: 30.0,
                                ),
                                alignment: Alignment.centerRight,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 4),
                                padding: const EdgeInsets.only(right: 10.0),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) => Cart().deleteItem(
                                  cartData.cartItems.keys.toList()[index]),
                              child: Container(
                                child: ListTile(
                                  leading: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      product: cartData
                                                          .cartItems.values
                                                          .toList()[index]
                                                          .index)));
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(cartData
                                              .cartItems.values
                                              .toList()[index]
                                              .image),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  title: Text(cartData.cartItems.values
                                      .toList()[index]
                                      .title),
                                  subtitle: Text(
                                      'Цена: ${cartData.cartItems.values.toList()[index].price} р.'),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      IconButton(
                                          icon:
                                              Icon(Icons.remove_circle_outline),
                                          onPressed: () {
                                            setState(() {});
                                            Cart().updateItemsSubOne(cartData
                                                .cartItems.values
                                                .toList()[index]
                                                .id);
                                          }),
                                      Text(
                                          'x${cartData.cartItems.values.toList()[index].number}'),
                                      IconButton(
                                          icon: Icon(Icons.add_circle_outline),
                                          onPressed: () {
                                            setState(() {
                                              Cart().updateItemsAddOne(cartData
                                                  .cartItems.values
                                                  .toList()[index]
                                                  .id);
                                            });
                                          }),
                                    ],
                                  ),
                                ),
                              ));
                        }),
                  )),
                ],
              ));
  }
}
