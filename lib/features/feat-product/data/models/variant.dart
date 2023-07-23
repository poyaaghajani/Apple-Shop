class Variant {
  String id;
  String name;
  int priceChange;
  String productId;
  String typeId;
  String value;

  Variant(
    this.id,
    this.name,
    this.priceChange,
    this.productId,
    this.typeId,
    this.value,
  );

  factory Variant.fromJson(Map<String, dynamic> json) {
    return Variant(
      json['id'],
      json['name'],
      json['price_change'],
      json['product_id'],
      json['type_id'],
      json['value'],
    );
  }
}
