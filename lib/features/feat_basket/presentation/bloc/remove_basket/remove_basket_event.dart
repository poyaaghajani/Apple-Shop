part of 'remove_basket_bloc.dart';

abstract class RemoveBasketEvent {
  const RemoveBasketEvent();
}

// remove product from basket
class RemoveProductFromBasket extends RemoveBasketEvent {
  final int index;

  RemoveProductFromBasket(this.index);
}
