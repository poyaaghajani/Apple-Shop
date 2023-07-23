part of 'get_basket_bloc.dart';

abstract class GetBasketState {
  const GetBasketState();
}

// init
class GetBasketInit extends GetBasketState {}

// completed
class GetBasketCompleted extends GetBasketState {
  final Either<String, List<BasketModel>> basketProducts;
  final int basketFinalPrice;

  GetBasketCompleted(this.basketProducts, this.basketFinalPrice);
}
