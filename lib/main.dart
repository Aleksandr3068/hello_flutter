import 'package:flutter/material.dart';
import 'package:hello_flutter/models/Product.dart';
import 'package:hello_flutter/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductDataProvider>(
          create: (context) => ProductDataProvider(),
        )
      ],
      child: MaterialApp(
        title: 'sportpit.ru',
        home: HomePage(),
      ),
    );
  }
}
