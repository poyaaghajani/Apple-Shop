import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String collectionId;
  @HiveField(2)
  String thumbnail;
  @HiveField(3)
  String description;
  @HiveField(4)
  int discountPrice;
  @HiveField(5)
  int price;
  @HiveField(6)
  String popularity;
  @HiveField(7)
  String name;
  @HiveField(8)
  int quantity;
  @HiveField(9)
  String categoryId;
  @HiveField(10)
  int? realPrice;
  @HiveField(11)
  num? persent;
  ProductModel(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.description,
    this.discountPrice,
    this.price,
    this.popularity,
    this.name,
    this.quantity,
    this.categoryId,
  ) {
    realPrice = price + discountPrice;
    persent = ((price - realPrice!) / price) * 100;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      json['id'],
      json['collectionId'],
      'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}',
      json['description'],
      json['discount_price'],
      json['price'],
      json['popularity'],
      json['name'],
      json['quantity'],
      json['category'],
    );
  }
}
