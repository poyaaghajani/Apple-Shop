import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:hive/hive.dart';

abstract class IFavoriteDatasource {
  void addToFavorite(ProductModel product);
  void removeFromFavorite(ProductModel product);
  List<ProductModel> getAllFavorites();
  bool isFavorite(ProductModel product);
}

class FavoriteLocalDatasource extends IFavoriteDatasource {
  var box = Hive.box<ProductModel>('productBox');

  @override
  void addToFavorite(ProductModel product) {
    box.put(product.id, product);
  }

  @override
  void removeFromFavorite(ProductModel product) {
    box.delete(product.id);
  }

  @override
  List<ProductModel> getAllFavorites() {
    return box.values.toList();
  }

  @override
  bool isFavorite(ProductModel product) {
    return box.containsKey(product.id);
  }
}
