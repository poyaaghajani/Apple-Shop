class PropertyModel {
  String title;
  String value;
  String productId;
  String id;

  PropertyModel(
    this.title,
    this.value,
    this.productId,
    this.id,
  );

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      json['title'],
      json['value'],
      json['product_id'],
      json['id'],
    );
  }
}
