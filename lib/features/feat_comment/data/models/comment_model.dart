class CommentModel {
  CommentModel({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  int? page;
  int? perPage;
  int? totalItems;
  int? totalPages;
  List<Items>? items;

  CommentModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  Items({
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.productId,
    this.text,
    this.updated,
    this.userId,
    this.userThumnail,
    this.username,
    this.avatar,
  });

  String? collectionId;
  String? collectionName;
  String? created;
  String? id;
  String? productId;
  String? text;
  String? updated;
  String? userId;
  String? userThumnail;
  String? username;
  String? avatar;

  Items.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionName = json['collectionName'];
    created = json['created'];
    id = json['id'];
    productId = json['product_id'];
    text = json['text'];
    updated = json['updated'];
    userId = json['user_id'];
    userThumnail =
        'http://startflutter.ir/api/files/${json['expand']['user_id']['collectionName']}/${json['expand']['user_id']['id']}/${json['expand']['user_id']['avatar']}';
    username = json['expand']['user_id']['name'];
    avatar = json['expand']['user_id']['avatar'];
  }
}
