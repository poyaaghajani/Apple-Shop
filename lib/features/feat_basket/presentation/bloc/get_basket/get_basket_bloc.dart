import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:apple_shop/features/feat_basket/data/repository/basket_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

part 'get_basket_event.dart';
part 'get_basket_state.dart';

class GetBasketBloc extends Bloc<GetBasketEvent, GetBasketState> {
  IBasketRepository basketRepository;

  GetBasketBloc(this.basketRepository) : super(GetBasketInit()) {
    on<GetAllBasketProducts>(onGetAllBasketProducts);
  }

  onGetAllBasketProducts(
      GetAllBasketProducts event, Emitter<GetBasketState> emit) async {
    var basketProducts = await basketRepository.getAllBasketProducts();
    var basketFinalPrice = await basketRepository.getBasketFinalPrice();

    emit(GetBasketCompleted(basketProducts, basketFinalPrice));
  }
}
