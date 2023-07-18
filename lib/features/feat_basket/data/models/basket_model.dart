import 'package:hive/hive.dart';
part 'basket_model.g.dart';

@HiveType(typeId: 0)
class BasketModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String thumbnail;
  @HiveField(2)
  int discountPrice;
  @HiveField(3)
  int price;
  @HiveField(4)
  String name;
  @HiveField(5)
  int quantity;
  @HiveField(6)
  int? realPrice;
  @HiveField(7)
  num? persent;
  BasketModel(
    this.id,
    this.thumbnail,
    this.discountPrice,
    this.price,
    this.name,
    this.quantity,
  ) {
    realPrice = price + discountPrice;
    persent = ((price - realPrice!) / price) * 100;
  }
}
