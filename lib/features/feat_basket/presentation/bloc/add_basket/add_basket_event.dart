part of 'add_basket_bloc.dart';

abstract class AddBasketEvent {
  const AddBasketEvent();
}

// add product to basket
class AddProductToBasket extends AddBasketEvent {
  final ProductModel product;
  const AddProductToBasket(this.product);
}
