import 'package:apple_shop/features/feat_basket/data/repository/basket_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

part 'remove_basket_event.dart';
part 'remove_basket_state.dart';

class RemoveBasketBloc extends Bloc<RemoveBasketEvent, RemoveBasketState> {
  IBasketRepository basketRepository;

  RemoveBasketBloc(this.basketRepository) : super(RemoveBasketInit()) {
    on<RemoveProductFromBasket>(onRemoveProductFromBasket);
  }

  onRemoveProductFromBasket(
      RemoveProductFromBasket event, Emitter<RemoveBasketState> emit) async {
    var rmoveProduct = await basketRepository.removeFromBasket(event.index);

    emit(RemoveBasketCompleted(rmoveProduct));
  }
}
