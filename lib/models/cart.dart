import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:hello_flutter/models/product.dart';

import 'product.dart';

// Cart
class Cart with ChangeNotifier {
  static final Cart _instance = Cart._internal();

  factory Cart() {
    return _instance;
  }

  Cart._internal();

  Map<String, CartProduct> cartItem = {};
  static Cart get shared => _instance;

  UnmodifiableMapView<String, CartProduct> get cartItems =>
      UnmodifiableMapView(cartItem);

  int get cartItemsCount => cartItem.length;

  double get totalAmount {
    var total = 0.0;
    cartItem.forEach((key, item) {
      total += item.price * item.number;
    });

    return total;
  }

  double get quantityProducts {
    var quantity = 0.0;
    cartItem.forEach((key, item) {
      quantity += item.number;
    });

    return quantity;
  }

  void addItem(recievedProduct) {
    if (cartItem.containsKey(recievedProduct.id)) {
      cartItem.update(
          recievedProduct.id,
          (ex) => CartProduct(
                index: ex.index,
                id: ex.id,
                title: ex.title,
                price: ex.price,
                image: ex.image,
                number: ex.number + 1,
              ));
    } else {
      cartItem.putIfAbsent(
          recievedProduct.id,
          () => CartProduct(
                index: recievedProduct,
                id: recievedProduct.id,
                title: recievedProduct.name,
                price: recievedProduct.price,
                image: recievedProduct.image,
                number: 1,
              ));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    cartItem.remove(productId);

    notifyListeners();
  }

  // Обновить корзину на +1 единицу товара по id
  void updateItemsAddOne(String productId) {
    cartItem.update(
      productId,
      (ex) => CartProduct(
        index: ex.index,
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
    if (cartItem[productId].number < 2) {
      deleteItem(productId);
    } else {
      cartItem.update(
        productId,
        (ex) => CartProduct(
          index: ex.index,
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
    cartItem = {};
    notifyListeners();
  }
}

class CartProduct {
  Product product;
  int number;
  int quantity;
  final index;
  final String id;
  final String title;
  final num price;
  final String image;

  CartProduct(
      {this.index,
      this.id,
      this.title,
      this.price,
      this.image,
      this.product,
      this.number});
}
