

class Product {
  static const tbProduct = "product";
  static const prId = "proId";
  static const prName = "proName";
  static const prImage = "proImage";
  static const prSubtitle = "proSubtitle";
  static const prPrice = "proPrice";
  static const prDescription = "proDescription";
  static const prBigimage = "proBigimage";

  Product({
    this.proId,
    this.proName,
    this.proSubtitle,
    this.proPrice,
    this.proImage,
    this.proDescription,
    this.proBigimage,
  });

  String proId;
  String proName;
  String proSubtitle;
  num proPrice;
  String proImage;
  String proDescription;
  String proBigimage;

    Product.fromMap(Map<String, dynamic> map) {
    proId = map[prId];
    proName = map[prName];
    proImage = map[prImage];
    proSubtitle = map[prSubtitle];
    proPrice = map[prPrice];
    proDescription = map[prDescription];
    proBigimage = map[prBigimage];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      prName: proName,
      prImage: proImage,
      prSubtitle: proSubtitle,
      prPrice: proPrice,
      prDescription: proDescription,
      prBigimage: proBigimage
    };
    if (proId != null) {
      map[prId] = proId;
    }

    return map;
  }

/*   String dbId;
  String dbName;
  String dbImag e;
  String dbSubtitle;
  num dbPrice;
  String dbDescription;
  String dbBigimage; */

  factory Product.fromJSON(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return Product(
          proId: json["id"],
          proSubtitle: json["subtitle"],
          proName: json["name"],
          proPrice: json["price"],
          proImage: json["image"],
          proDescription: json["description"],
          proBigimage: json["bigimage"]);
    }
  }

  get id => proId;
  get name => proName;
  get subtitle => proSubtitle;
  get price => proPrice;
  get image => proImage;
  get description => proDescription;
  get bigimage => proBigimage;


}
