class Cart {
  final index;
  final String id;
  final String title;
  final int number;
  final num price;
  final String image;

  Cart({this.index, this.id, this.title, this.number, this.price, this.image});
}

class Singleton {
  static final Singleton _instance = Singleton._internal();
  Map<String, Cart> cartItem = {};

  factory Singleton() {
    return _instance;
  }

  Singleton._internal() {}
}
