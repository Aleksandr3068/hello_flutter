import 'package:flutter/material.dart';

import 'package:hello_flutter/pages/item_page.dart';
import 'package:hello_flutter/models/card.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = CartDataProvider();
    final cartItems = cartData.cartItems;

    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartItems.length,
                itemBuilder: (context, index) => Hero(
                  tag: cartItems.values.toList()[index].image,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              todo: cartData.cartItems.values
                                  .toList()[index]
                                  .index)));
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          width: 35,
                          height: 30,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black54,
                                blurRadius: 4.0,
                                spreadRadius: 5.0,
                                offset: Offset(-2, 2),
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage(
                                  cartItems.values.toList()[index].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                            right: 2,
                            bottom: 5,
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black,
                              ),
                              constraints: BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                  '${cartItems.values.toList()[index].number}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                  )),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
