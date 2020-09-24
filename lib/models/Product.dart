import 'dart:collection';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String name;
  final String subtitle;
  final String price;
  final String image;
  final String description;
  final String bigimage;

  Product({
    @required this.name,
    @required this.subtitle,
    @required this.price,
    @required this.image,
    @required this.description,
    @required this.bigimage,
  });
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
        name: 'Scitec Nutrition Isolate Amino',
        subtitle: '500 капсул',
        price: '500 р.',
        image: 'images/pic3.png',
        bigimage: 'images/picbig3.png',
        description:
            'Isolate Amino – анаболический комплекс аминокислот от компании Scitec Nutrition.'),
    Product(
        name: 'Scitec Nutrition Egg Pro',
        subtitle: '900 г',
        price: '1200 р.',
        image: 'images/pic1.jpg',
        bigimage: 'images/picbig1.jpg',
        description:
            'Добавка Egg Pro от Scitec Nutrition содержит высококонцентрированный куриный белок, очищенный от примесей и пищевых добавок.'),
    Product(
        name: 'Scitec Nutrition Carni Complex',
        subtitle: '60 капсул',
        price: '1500 р.',
        image: 'images/pic2.jpg',
        bigimage: 'images/picbig2.jpg',
        description:
            'Scitec Nutrition Carni Complex - специальный микс L-карнитина и ацетил L-карнитин для сжигания жиров.'),
    Product(
        name: 'Scitec Nutrition Attack 2.0',
        subtitle: '320 г',
        price: '350 р.',
        image: 'images/pic4.jpg',
        bigimage: 'images/picbig4.jpg',
        description:
            'Предтренировочный комплекс Attack 2.0 от Scitec Nutrition из 17 компонентов поможет лучше подготовиться к предстоящей тренировке.'),
    Product(
        name: 'Scitec Nutrition Hot Blood 3.0',
        subtitle: '20 г',
        price: '1500 р.',
        image: 'images/pic5.jpg',
        bigimage: 'images/picbig5.jpg',
        description:
            'Scitec Nutrition Hot Blood 3.0 - новый уникальный формат упаковки белковых смесей..'),
    Product(
        name: 'Scitec Nutrition c1000',
        subtitle: '500 г',
        price: '1000 р.',
        image: 'images/pic6.jpg',
        bigimage: 'images/picbig6.jpg',
        description:
            'C1000 + Bioflavonoid – источник витамина С, обогащенный растительными экстрактами и биофлавоноидами, от компании Scitec Nutrition.'),
    Product(
        name: 'Optimum Nutrition 100% Whey Gold Standard',
        subtitle: '200 г',
        price: '1400 р.',
        image: 'images/pic7.jpg',
        bigimage: 'images/picbig7.jpg',
        description:
            'Миллионы покупателей довольны Optimum Nutrition 100% WHEY GOLD STANDARD, и они  не могут быть неправы!'),
    Product(
        name: 'Ultimate Nutrition Prostar 100% Whey Protein',
        subtitle: '20 г',
        price: '5000 р.',
        image: 'images/pic8.jpg',
        bigimage: 'images/picbig8.jpg',
        description:
            '100% Prostar Whey Protein - выбор тех, кто хочет находиться на пике физической активности без боязни, что тренинг может пошатнуть иммунную систему.'),
    Product(
        name: 'Optimum Nutrition Serious Mass',
        subtitle: '5.44 кг',
        price: '3000 р.',
        image: 'images/pic9.jpg',
        bigimage: 'images/picbig9.jpg',
        description:
            '1250 калорий в порции с натуральным вкусом - это то, что надо для создания мускулатуры поразительной массы и силы.'),
    Product(
        name: 'Ultimate Nutrition BCAA Powder 12000 Flavored',
        subtitle: '20 г',
        price: '1880 р.',
        image: 'images/pic10.jpg',
        bigimage: 'images/picbig10.jpg',
        description:
            'Аминокислоты BCAA способны поддерживать целостность мышечных тканей в период силовых тренировок. BCAA выступают в качестве защитников мышечных тканей от разрушительного воздействия катаболических процессов.'),
    Product(
        name: 'Bombbar Protein Bar',
        subtitle: '5.44 кг',
        price: '100 р.',
        image: 'images/pic11.jpg',
        bigimage: 'images/picbig11.jpg',
        description:
            'Bombbar Protein Bar – это новый питательный протеиновый батончик с оптимальным содержанием белков и пищевых волокон, а также пониженным количеством жиров и углеводов. Бомбар идеально подходит для быстрого перекуса в дороге или перед тренировкой. Может заменить прием пищи.'),
    Product(
        name: 'Scitec Nutrition Isolate Amino',
        subtitle: '500 капсул',
        price: '500 р.',
        image: 'images/pic3.png',
        bigimage: 'images/picbig3.png',
        description:
            'Isolate Amino – анаболический комплекс аминокислот от компании Scitec Nutrition.'),
    Product(
        name: 'Scitec Nutrition Egg Pro',
        subtitle: '900 г',
        price: '1200 р.',
        image: 'images/pic1.jpg',
        bigimage: 'images/picbig1.jpg',
        description:
            'Добавка Egg Pro от Scitec Nutrition содержит высококонцентрированный куриный белок, очищенный от примесей и пищевых добавок.'),
    Product(
        name: 'Scitec Nutrition Carni Complex',
        subtitle: '60 капсул',
        price: '1500 р.',
        image: 'images/pic2.jpg',
        bigimage: 'images/picbig2.jpg',
        description:
            'Scitec Nutrition Carni Complex - специальный микс L-карнитина и ацетил L-карнитин для сжигания жиров.'),
    Product(
        name: 'Scitec Nutrition Attack 2.0',
        subtitle: '320 г',
        price: '350 р.',
        image: 'images/pic4.jpg',
        bigimage: 'images/picbig4.jpg',
        description:
            'Предтренировочный комплекс Attack 2.0 от Scitec Nutrition из 17 компонентов поможет лучше подготовиться к предстоящей тренировке.'),
    Product(
        name: 'Scitec Nutrition Hot Blood 3.0',
        subtitle: '20 г',
        price: '1500 р.',
        image: 'images/pic5.jpg',
        bigimage: 'images/picbig5.jpg',
        description:
            'Scitec Nutrition Hot Blood 3.0 - новый уникальный формат упаковки белковых смесей..'),
    Product(
        name: 'Scitec Nutrition c1000',
        subtitle: '500 г',
        price: '1000 р.',
        image: 'images/pic6.jpg',
        bigimage: 'images/picbig6.jpg',
        description:
            'C1000 + Bioflavonoid – источник витамина С, обогащенный растительными экстрактами и биофлавоноидами, от компании Scitec Nutrition.'),
    Product(
        name: 'Optimum Nutrition 100% Whey Gold Standard',
        subtitle: '200 г',
        price: '1400 р.',
        image: 'images/pic7.jpg',
        bigimage: 'images/picbig7.jpg',
        description:
            'Миллионы покупателей довольны Optimum Nutrition 100% WHEY GOLD STANDARD, и они  не могут быть неправы!'),
    Product(
        name: 'Ultimate Nutrition Prostar 100% Whey Protein',
        subtitle: '20 г',
        price: '5000 р.',
        image: 'images/pic8.jpg',
        bigimage: 'images/picbig8.jpg',
        description:
            '100% Prostar Whey Protein - выбор тех, кто хочет находиться на пике физической активности без боязни, что тренинг может пошатнуть иммунную систему.'),
    Product(
        name: 'Optimum Nutrition Serious Mass',
        subtitle: '5.44 кг',
        price: '3000 р.',
        image: 'images/pic9.jpg',
        bigimage: 'images/picbig9.jpg',
        description:
            '1250 калорий в порции с натуральным вкусом - это то, что надо для создания мускулатуры поразительной массы и силы.'),
    Product(
        name: 'Ultimate Nutrition BCAA Powder 12000 Flavored',
        subtitle: '20 г',
        price: '1880 р.',
        image: 'images/pic10.jpg',
        bigimage: 'images/picbig10.jpg',
        description:
            'Аминокислоты BCAA способны поддерживать целостность мышечных тканей в период силовых тренировок. BCAA выступают в качестве защитников мышечных тканей от разрушительного воздействия катаболических процессов.'),
    Product(
        name: 'Bombbar Protein Bar',
        subtitle: '5.44 кг',
        price: '100 р.',
        image: 'images/pic11.jpg',
        bigimage: 'images/picbig11.jpg',
        description:
            'Bombbar Protein Bar – это новый питательный протеиновый батончик с оптимальным содержанием белков и пищевых волокон, а также пониженным количеством жиров и углеводов. Бомбар идеально подходит для быстрого перекуса в дороге или перед тренировкой. Может заменить прием пищи.'),
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  /*  Product getElemementByID(String id) =>
      _items.singleWhere((value) => value == id); */
}
