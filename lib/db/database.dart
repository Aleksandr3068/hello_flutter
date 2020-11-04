import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'ProductbaseDemo.db';
  static const _databaseVersion = 1;

  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    print(dbPath);
    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    //create tables
    await db.execute('''
      CREATE TABLE ${Contact.tbProduct}(
        ${Contact.proId} TEXT PRIMARY KEY,
        ${Contact.prName} TEXT,
        ${Contact.prSubtitle} TEXT,
        ${Contact.prImage} TEXT,
        ${Contact.prPrice} INTEGER
      )
      ''');
  }

  //product - insert
  Future<int> insertContact(Contact contact) async {
    Database db = await database;
    return await db.insert(Contact.tbProduct, contact.toMap());
  }

//product- update
  Future<int> updateContact(Contact contact) async {
    Database db = await database;
    return await db.update(Contact.tbProduct, contact.toMap(),
        where: '${Contact.proId}=?', whereArgs: [contact.id]);
  }

//product - delete
  Future<int> deleteContact(String id) async {
    Database db = await database;
    return await db.delete(Contact.tbProduct,
        where: '${Contact.proId}=?', whereArgs: [id]);
  }

//product - retrieve all
  Future<List<Contact>> fetchContacts() async {
    Database db = await database;
    List<Map> contacts = await db.query(Contact.tbProduct);
    return contacts.length == 0
        ? []
        : contacts.map((x) => Contact.fromMap(x)).toList();
  }
}

class Contact {
  static const tbProduct = "product";
  static const proId = "id";
  static const prName = "name";
  static const prImage = "image";
  static const prSubtitle = "subtitle";
  static const prPrice = "price";

  Contact({this.id, this.name, this.image, this.subtitle, this.price});

  String id;
  String name;
  String image;
  String subtitle;
  num price;

  Contact.fromMap(Map<String, dynamic> map) {
    id = map[proId];
    name = map[prName];
    image = map[prImage];
    subtitle = map[prSubtitle];
    price = map[prPrice];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      prName: name,
      prImage: image,
      prSubtitle: subtitle,
      prPrice: price
    };
    if (id != null) {
      map[proId] = id;
    }

    return map;
  }
}
