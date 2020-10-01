import 'dart:collection';
import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  final String id;
  final String name;
  final String subtitle;
  final num price;
  final String image;
  final String description;
  final String bigimage;

  Todo({
    @required this.id,
    @required this.name,
    @required this.subtitle,
    @required this.price,
    @required this.image,
    @required this.description,
    @required this.bigimage,
  });
}

class ProductDataProvider with ChangeNotifier {
  List<Todo> _items = [
    Todo(
        id: 'p1',
        name: 'Scitec Nutrition Isolate Amino',
        subtitle: '500 капсул',
        price: 1100,
        image: 'images/pic3.png',
        bigimage: 'images/picbig3.png',
        description:
            'Isolate Amino – анаболический комплекс аминокислот от компании Scitec Nutrition.'),
    Todo(
        id: 'p2',
        name: 'Scitec Nutrition Egg Pro',
        subtitle: '900 г',
        price: 1200,
        image: 'images/pic1.jpg',
        bigimage: 'images/picbig1.jpg',
        description:
            'Добавка Egg Pro от Scitec Nutrition содержит высококонцентрированный куриный белок, очищенный от примесей и пищевых добавок.'),
    Todo(
        id: 'p3',
        name: 'Scitec Nutrition Carni Complex',
        subtitle: '60 капсул',
        price: 1500,
        image: 'images/pic2.jpg',
        bigimage: 'images/picbig2.jpg',
        description:
            'Scitec Nutrition Carni Complex - специальный микс L-карнитина и ацетил L-карнитин для сжигания жиров.'),
    Todo(
        id: 'p4',
        name: 'Scitec Nutrition Attack 2.0',
        subtitle: '320 г',
        price: 350,
        image: 'images/pic4.jpg',
        bigimage: 'images/picbig4.jpg',
        description:
            'Предтренировочный комплекс Attack 2.0 от Scitec Nutrition из 17 компонентов поможет лучше подготовиться к предстоящей тренировке.'),
    Todo(
        id: 'p5',
        name: 'Scitec Nutrition Hot Blood 3.0',
        subtitle: '20 г',
        price: 1500,
        image: 'images/pic5.jpg',
        bigimage: 'images/picbig5.jpg',
        description:
            'Scitec Nutrition Hot Blood 3.0 - новый уникальный формат упаковки белковых смесей..'),
    Todo(
        id: 'p6',
        name: 'Scitec Nutrition c1000',
        subtitle: '500 г',
        price: 1000,
        image: 'images/pic6.jpg',
        bigimage: 'images/picbig6.jpg',
        description:
            'C1000 + Bioflavonoid – источник витамина С, обогащенный растительными экстрактами и биофлавоноидами, от компании Scitec Nutrition.'),
    Todo(
        id: 'p7',
        name: 'Optimum Nutrition 100% Whey Gold Standard',
        subtitle: '200 г',
        price: 1400,
        image: 'images/pic7.jpg',
        bigimage: 'images/picbig7.jpg',
        description:
            'Миллионы покупателей довольны Optimum Nutrition 100% WHEY GOLD STANDARD, и они  не могут быть неправы!'),
    Todo(
        id: 'p8',
        name: 'Ultimate Nutrition Prostar 100% Whey Protein',
        subtitle: '20 г',
        price: 5000,
        image: 'images/pic8.jpg',
        bigimage: 'images/picbig8.jpg',
        description:
            '100% Prostar Whey Protein - выбор тех, кто хочет находиться на пике физической активности без боязни, что тренинг может пошатнуть иммунную систему.'),
    Todo(
        id: 'p9',
        name: 'Optimum Nutrition Serious Mass',
        subtitle: '5.44 кг',
        price: 3000,
        image: 'images/pic9.jpg',
        bigimage: 'images/picbig9.jpg',
        description:
            '1250 калорий в порции с натуральным вкусом - это то, что надо для создания мускулатуры поразительной массы и силы.'),
    Todo(
        id: 'p10',
        name: 'Ultimate Nutrition BCAA Powder 12000 Flavored',
        subtitle: '20 г',
        price: 1880,
        image: 'images/pic10.jpg',
        bigimage: 'images/picbig10.jpg',
        description:
            'Аминокислоты BCAA способны поддерживать целостность мышечных тканей в период силовых тренировок. BCAA выступают в качестве защитников мышечных тканей от разрушительного воздействия катаболических процессов.'),
    Todo(
        id: 'p11',
        name: 'Bombbar Protein Bar',
        subtitle: '5.44 кг',
        price: 100,
        image: 'images/pic11.jpg',
        bigimage: 'images/picbig11.jpg',
        description:
            'Bombbar Protein Bar – это новый питательный протеиновый батончик с оптимальным содержанием белков и пищевых волокон, а также пониженным количеством жиров и углеводов. Бомбар идеально подходит для быстрого перекуса в дороге или перед тренировкой. Может заменить прием пищи.'),
    Todo(
        id: 'p12',
        name: 'Scitec Nutrition Isolate Amino',
        subtitle: '500 капсул',
        price: 1100,
        image: 'images/pic3.png',
        bigimage: 'images/picbig3.png',
        description:
            'Isolate Amino – анаболический комплекс аминокислот от компании Scitec Nutrition.'),
    Todo(
        id: 'p13',
        name: 'Scitec Nutrition Egg Pro',
        subtitle: '900 г',
        price: 1200,
        image: 'images/pic1.jpg',
        bigimage: 'images/picbig1.jpg',
        description:
            'Добавка Egg Pro от Scitec Nutrition содержит высококонцентрированный куриный белок, очищенный от примесей и пищевых добавок.'),
    Todo(
        id: 'p14',
        name: 'Scitec Nutrition Carni Complex',
        subtitle: '60 капсул',
        price: 1500,
        image: 'images/pic2.jpg',
        bigimage: 'images/picbig2.jpg',
        description:
            'Scitec Nutrition Carni Complex - специальный микс L-карнитина и ацетил L-карнитин для сжигания жиров.'),
    Todo(
        id: 'p15',
        name: 'Scitec Nutrition Attack 2.0',
        subtitle: '320 г',
        price: 350,
        image: 'images/pic4.jpg',
        bigimage: 'images/picbig4.jpg',
        description:
            'Предтренировочный комплекс Attack 2.0 от Scitec Nutrition из 17 компонентов поможет лучше подготовиться к предстоящей тренировке.'),
    Todo(
        id: 'p16',
        name: 'Scitec Nutrition Hot Blood 3.0',
        subtitle: '20 г',
        price: 1500,
        image: 'images/pic5.jpg',
        bigimage: 'images/picbig5.jpg',
        description:
            'Scitec Nutrition Hot Blood 3.0 - новый уникальный формат упаковки белковых смесей..'),
    Todo(
        id: 'p17',
        name: 'Scitec Nutrition c1000',
        subtitle: '500 г',
        price: 1000,
        image: 'images/pic6.jpg',
        bigimage: 'images/picbig6.jpg',
        description:
            'C1000 + Bioflavonoid – источник витамина С, обогащенный растительными экстрактами и биофлавоноидами, от компании Scitec Nutrition.'),
    Todo(
        id: 'p18',
        name: 'Optimum Nutrition 100% Whey Gold Standard',
        subtitle: '200 г',
        price: 1400,
        image: 'images/pic7.jpg',
        bigimage: 'images/picbig7.jpg',
        description:
            'Миллионы покупателей довольны Optimum Nutrition 100% WHEY GOLD STANDARD, и они  не могут быть неправы!'),
    Todo(
        id: 'p19',
        name: 'Ultimate Nutrition Prostar 100% Whey Protein',
        subtitle: '20 г',
        price: 5000,
        image: 'images/pic8.jpg',
        bigimage: 'images/picbig8.jpg',
        description:
            '100% Prostar Whey Protein - выбор тех, кто хочет находиться на пике физической активности без боязни, что тренинг может пошатнуть иммунную систему.'),
    Todo(
        id: 'p20',
        name: 'Optimum Nutrition Serious Mass',
        subtitle: '5.44 кг',
        price: 3000,
        image: 'images/pic9.jpg',
        bigimage: 'images/picbig9.jpg',
        description:
            '1250 калорий в порции с натуральным вкусом - это то, что надо для создания мускулатуры поразительной массы и силы.'),
    Todo(
        id: 'p21',
        name: 'Ultimate Nutrition BCAA Powder 12000 Flavored',
        subtitle: '20 г',
        price: 1880,
        image: 'images/pic10.jpg',
        bigimage: 'images/picbig10.jpg',
        description:
            'Аминокислоты BCAA способны поддерживать целостность мышечных тканей в период силовых тренировок. BCAA выступают в качестве защитников мышечных тканей от разрушительного воздействия катаболических процессов.'),
    Todo(
        id: 'p22',
        name: 'Bombbar Protein Bar',
        subtitle: '5.44 кг',
        price: 100,
        image: 'images/pic11.jpg',
        bigimage: 'images/picbig11.jpg',
        description:
            'Bombbar Protein Bar – это новый питательный протеиновый батончик с оптимальным содержанием белков и пищевых волокон, а также пониженным количеством жиров и углеводов. Бомбар идеально подходит для быстрого перекуса в дороге или перед тренировкой. Может заменить прием пищи.'),
  ];

  UnmodifiableListView<Todo> get items => UnmodifiableListView(_items);

  Todo getElementById(String id) =>
      _items.singleWhere((value) => value.id == id);
}
