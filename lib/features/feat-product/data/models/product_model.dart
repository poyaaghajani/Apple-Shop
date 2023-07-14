class ProductModel {
  String id;
  String collectionId;
  String thumbnail;
  String description;
  int discountPrice;
  int price;
  String popularity;
  String name;
  int quantity;
  String categoryId;
  int? realPrice;
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
