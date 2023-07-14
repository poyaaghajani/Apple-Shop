class BannerModel {
  String? id;
  String? collectionId;
  String? thumbnail;
  String? categoryId;

  BannerModel(
    this.id,
    this.collectionId,
    this.thumbnail,
    this.categoryId,
  );

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      json['id'],
      json['collectionId'],
      'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}',
      json['categoryId'],
    );
  }
}
