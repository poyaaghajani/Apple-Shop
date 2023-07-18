part of 'get_basket_bloc.dart';

abstract class GetBasketEvent {
  const GetBasketEvent();
}

// get all products in basket
class GetAllBasketProducts extends GetBasketEvent {}
