import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_favorite/data/datasource/favorite_datasource.dart';
import 'package:dartz/dartz.dart';

abstract class IFavoriteRepository {
  Future<Either<String, List<ProductModel>>> getAllFavorites();
}

class FavoriteRepository extends IFavoriteRepository {
  IFavoriteDatasource datasource;
  FavoriteRepository(this.datasource);

  @override
  Future<Either<String, List<ProductModel>>> getAllFavorites() async {
    try {
      var allFavorites = datasource.getAllFavorites();
      return right(allFavorites);
    } catch (_) {
      return left('مشکلی در نمایش لیست پیش آمده');
    }
  }
}
