class CategoryModel {
  String? collectionId;
  String? id;
  String? thumbnail;
  String? title;
  String? color;
  String? icon;

  CategoryModel(
    this.collectionId,
    this.id,
    this.thumbnail,
    this.title,
    this.color,
    this.icon,
  );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      json['collectionId'],
      json['id'],
      'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['thumbnail']}',
      json['title'],
      json['color'],
      'http://startflutter.ir/api/files/${json['collectionId']}/${json['id']}/${json['icon']}',
    );
  }
}
