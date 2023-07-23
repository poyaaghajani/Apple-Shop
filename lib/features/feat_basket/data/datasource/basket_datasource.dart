import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class IBasketDatasource {
  Future<void> addToBasket(BasketModel basket);
  Future<List<BasketModel>> getAllBasketProducts();
  Future<void> removeFromBasket(int index);
  Future<int> getBasketFinalPrice();
}

class BasketLocalDatasource extends IBasketDatasource {
  var box = Hive.box<BasketModel>('basketBox');

  @override
  Future<void> addToBasket(BasketModel basket) async {
    box.add(basket);
  }

  @override
  Future<List<BasketModel>> getAllBasketProducts() async {
    return box.values.toList();
  }

  @override
  Future<void> removeFromBasket(int index) async {
    box.deleteAt(index);
  }

  @override
  Future<int> getBasketFinalPrice() async {
    var productList = box.values.toList();

    var finalPrice = productList.fold(0, (accumulator, element) {
      return accumulator + element.realPrice!;
    });

    return finalPrice;
  }
}
