part of 'add_basket_bloc.dart';

abstract class AddBasketState {
  const AddBasketState();
}

class AddBasketInit extends AddBasketState {}

class AddBasketCompleted extends AddBasketState {
  final Either<String, String> basket;
  const AddBasketCompleted(this.basket);
}
