class ProductGallery {
  String? imageUrl;
  String? productId;

  ProductGallery(this.imageUrl, this.productId);

  factory ProductGallery.fromJson(Map<String, dynamic> json) {
    return ProductGallery(
      'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['image']}',
      json['product_id'],
    );
  }
}
