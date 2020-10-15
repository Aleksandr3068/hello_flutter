import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/models/singleton.dart';

// Cart
class CartDataProvider with ChangeNotifier {
  var singleton = Singleton();

  UnmodifiableMapView<String, Cart> get cartItems =>
      UnmodifiableMapView(singleton.cartItem);

  int get cartItemsCount => singleton.cartItem.length;

  double get totalAmount {
    var total = 0.0;
    singleton.cartItem.forEach((key, item) {
      total += item.price * item.number;
    });

    return total;
  }

  void addItem({productId, price, title, image, index}) {
    if (singleton.cartItem.containsKey(productId)) {
      singleton.cartItem.update(
          productId,
          (ex) => Cart(
                index: index,
                id: ex.id,
                title: ex.title,
                price: ex.price,
                image: ex.image,
                number: ex.number + 1,
              ));
    } else {
      singleton.cartItem.putIfAbsent(
          productId,
          () => Cart(
                index: index,
                id: '${DateTime.now()}',
                title: title,
                price: price,
                image: image,
                number: 1,
              ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    singleton.cartItem.remove(productId);

    notifyListeners();
  }

  // Обновить корзину на +1 единицу товара по id
  void updateItemsAddOne(String productId) {
    singleton.cartItem.update(
      productId,
      (ex) => Cart(
        id: ex.id,
        title: ex.title,
        price: ex.price,
        image: ex.image,
        number: ex.number + 1,
      ),
    );
    notifyListeners();
  }

  // Обновить корзину на -1 единицу товара по id
  void updateItemsSubOne(String productId) {
    if (singleton.cartItem[productId].number < 2) {
      deleteItem(productId);
    } else {
      singleton.cartItem.update(
        productId,
        (ex) => Cart(
          id: ex.id,
          title: ex.title,
          price: ex.price,
          image: ex.image,
          number: ex.number - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    singleton.cartItem = {};
    notifyListeners();
  }
}
