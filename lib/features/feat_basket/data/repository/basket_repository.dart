import 'package:apple_shop/features/feat_basket/data/datasource/basket_datasource.dart';
import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:dartz/dartz.dart';

abstract class IBasketRepository {
  Future<Either<String, String>> addToBasket(BasketModel basket);
  Future<Either<String, List<BasketModel>>> getAllBasketProducts();
  Future<Either<String, String>> removeFromBasket(int index);
  Future<int> getBasketFinalPrice();
}

class BasketRepository extends IBasketRepository {
  IBasketDatasource datasource;
  BasketRepository(this.datasource);

  @override
  Future<Either<String, String>> addToBasket(BasketModel basket) async {
    try {
      await datasource.addToBasket(basket);
      return right('محصول به سبد خرید اضافه شد');
    } catch (_) {
      return left('محصول به سبد خرید اضافه نشد');
    }
  }

  @override
  Future<Either<String, List<BasketModel>>> getAllBasketProducts() async {
    try {
      var allBasketProducts = await datasource.getAllBasketProducts();
      return right(allBasketProducts);
    } catch (_) {
      return left('محصولی برای نمایش وجود ندارد');
    }
  }

  @override
  Future<Either<String, String>> removeFromBasket(int index) async {
    try {
      await datasource.removeFromBasket(index);
      return right('محصول شما از سبد خرید برداشته شد');
    } catch (_) {
      return left('مشکلی در حذف محصول پیش آمده');
    }
  }

  @override
  Future<int> getBasketFinalPrice() async {
    return await datasource.getBasketFinalPrice();
  }
}
