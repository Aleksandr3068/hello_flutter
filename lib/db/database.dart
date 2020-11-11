import 'dart:io';
import 'package:hello_flutter/models/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'DatabaseTest.db';
  static const _databaseVersion = 1;
  static const tbProduct = "product";

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
      CREATE TABLE $tbProduct(
        ${Product.prId} TEXT PRIMARY KEY,
        ${Product.prName} TEXT,
        ${Product.prSubtitle} TEXT,
        ${Product.prImage} TEXT,
        ${Product.prBigimage} TEXT,
        ${Product.prDescription} TEXT,
        ${Product.prPrice} INTEGER
      )
      ''');
  }

  //product - insert
  Future<int> insertProduct(Product product) async {
    Database db = await database;
    return await db.insert(tbProduct, product.toMap());
  }

//product- update
  Future<int> updateProduct(Product product) async {
    Database db = await database;
    return await db.update(tbProduct, product.toMap(),
        where: '${Product.prId}=?', whereArgs: [product.id]);
  }

//product - delete
  Future<int> deleteProduct(String id) async {
    Database db = await database;
    return await db
        .delete(tbProduct, where: '${Product.prId}=?', whereArgs: [id]);
  }

//product - retrieve all
  Future<List<Product>> fetchProducts() async {
    Database db = await database;
    List<Map> products = await db.query(tbProduct);
    return products.length == 0
        ? []
        : products.map((productList) => Product.fromMap(productList)).toList();
  }
}
