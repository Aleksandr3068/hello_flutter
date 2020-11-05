import 'package:flutter/material.dart';
import 'package:hello_flutter/db/database.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Contact _contact = Contact();
  List<Contact> _contacts = [];
  DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    _dbHelper = DatabaseHelper.instance;
    _refreshContactList();
  }

  _refreshContactList() async {
    List<Contact> x = await _dbHelper.fetchContacts();
    setState(() {
      _contacts = x;
      print(_contacts);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool _isSelect = true;

    return Scaffold(
      appBar: AppBar(
        title: Text('Избранное', style: TextStyle(color: Colors.black)),
        actions: <Widget>[],
      ),
      body: _contacts.isEmpty
          ? Card(
              elevation: 10.0,
              margin: const EdgeInsets.all(30.0),
              child: Container(
                  height: 100,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyText1,
                      children: [
                        TextSpan(text: 'Нажмите на'),
                        WidgetSpan(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(Icons.favorite, color: Colors.red[500]),
                          ),
                        ),
                        TextSpan(
                            text:
                                'напротив любого товара, чтобы вернуться к нему позже'),
                      ],
                    ),
                  )),
            )
          : OrientationBuilder(
              builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  children: List.generate(_contacts.length, (index) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      // color: Colors.black12,
                      child: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        verticalDirection: VerticalDirection.down,
                        children: <Widget>[
                          new Expanded(
                            child: Image.asset(
                              _contacts[index].image,
                            ),
                          ),
                          new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  new Text(
                                    '${_contacts[index].price}'.toString() +
                                        " р.",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: (_isSelect
                                        ? Icon(Icons.favorite)
                                        : Icon(Icons.favorite_border)),
                                    onPressed: () async {
                                      await _dbHelper
                                          .deleteContact(_contacts[index].id);
                                      _refreshContactList();
                                    },
                                    color: Colors.red[500],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  new Text(
                                    _contacts[index].name,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
            ),
    );
  }
}
