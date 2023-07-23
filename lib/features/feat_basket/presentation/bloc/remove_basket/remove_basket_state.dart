part of 'remove_basket_bloc.dart';

abstract class RemoveBasketState {
  const RemoveBasketState();
}

// init
class RemoveBasketInit extends RemoveBasketState {}

// completed
class RemoveBasketCompleted extends RemoveBasketState {
  final Either<String, String> removeFromBasket;

  const RemoveBasketCompleted(this.removeFromBasket);
}
