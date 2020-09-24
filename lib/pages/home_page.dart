import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_flutter/models/Product.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('sportpit.ru'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: productData.items.length,
        itemBuilder: (context, int index) {
          return ListTile(
            title: Text(productData.items[index].name),
            subtitle: Text(productData.items[index].subtitle),
            trailing: Text(productData.items[index].price,
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
            leading: Image.asset(productData.items[index].image),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(todo: productData.items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Product todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(todo.image),
                    fit: BoxFit.cover,
                  ),
                ),
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
                      todo.name,
                      style: TextStyle(fontSize: 26.0),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Цена: ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text(
                          todo.price,
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(todo.description),
                    SizedBox(
                      height: 20.0,
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
