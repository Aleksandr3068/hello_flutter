import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:hello_flutter/db/database.dart';
import 'package:hello_flutter/models/product.dart';
import 'package:hello_flutter/models/cart.dart';
import 'package:hello_flutter/pages/cart_page.dart';
import 'package:hello_flutter/pages/home_page.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  DetailScreen({Key key, this.product}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isSelect = false;

  List<Product> _products = [];
  DatabaseHelper _dbHelper;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    _refreshContactList();
  }

  _refreshContactList() async {
    List<Product> x = await _dbHelper.fetchProducts();
    setState(() {
      _products = x;
      print(_products);
      _toggleFavorite();
    });
  }

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
          widget.product.name,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Hero(
              tag: widget.product.image,
              child: Container(
                child: Image.asset(widget.product.bigimage),
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
                      widget.product.name + " " + widget.product.subtitle,
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
                          '${widget.product.price}'.toString() + " р.",
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(widget.product.description),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: IconButton(
                        icon: (_isSelect
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border)),
                        onPressed: () async {
                          _toggleFavorite();
                          Product product = Product(
                              proId: widget.product.id,
                              proImage: widget.product.image,
                              proSubtitle: widget.product.subtitle,
                              proName: widget.product.name,
                              proPrice: widget.product.price,
                              proBigimage: widget.product.bigimage,
                              proDescription: widget.product.description);
                          var form = _formKey.currentState;
                          if (_isSelect) {
                            await _dbHelper.deleteProduct(widget.product.id);
                            form.reset();
                            _refreshContactList();
                            _isSelect = false;
                          } else {
                            if (form.validate()) {
                              form.save();
                              await _dbHelper.insertProduct(product);
                              form.reset();
                              await _refreshContactList();
                            }
                          }
                        },
                        color: Colors.red[500],
                      ),
                    ),
                    Cart().cartItems.containsKey(widget.product.id)
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
                              setState(() {
                                Cart.shared.addItem(widget.product);
                              });
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

  void _toggleFavorite() {
    setState(() {
      _products.forEach((item) {
        if (item.id == widget.product.id) {
          _isSelect = true;
        }
      });
    });
  }
}
