import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  final String _id;
  final String _name;
  final String _subtitle;
  final num _price;
  final String _image;
  final String _description;
  final String _bigimage;

  Todo(
    this._id,
    this._name,
    this._subtitle,
    this._price,
    this._image,
    this._description,
    this._bigimage,
  );

  factory Todo.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return Todo(json["id"], json["name"], json["subtitle"], json["price"],
          json["image"], json["description"], json["bigimage"]);
    }
  }

  get id => this._id;
  get name => this._name;
  get subtitle => this._subtitle;
  get price => this._price;
  get image => this._image;
  get description => this._description;
  get bigimage => this._bigimage;
}
