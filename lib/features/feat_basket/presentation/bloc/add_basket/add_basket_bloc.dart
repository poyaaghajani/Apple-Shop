import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:apple_shop/features/feat_basket/data/repository/basket_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

part 'add_basket_event.dart';
part 'add_basket_state.dart';

class AddBasketBloc extends Bloc<AddBasketEvent, AddBasketState> {
  IBasketRepository basketRepository;
  AddBasketBloc(this.basketRepository) : super(AddBasketInit()) {
    on<AddProductToBasket>(onAddProductToBasket);
  }

  onAddProductToBasket(
      AddProductToBasket event, Emitter<AddBasketState> emit) async {
    var item = BasketModel(
      event.product.id,
      event.product.thumbnail,
      event.product.discountPrice,
      event.product.price,
      event.product.name,
      event.product.quantity,
    );
    var basket = await basketRepository.addToBasket(item);

    emit(AddBasketCompleted(basket));
  }
}
