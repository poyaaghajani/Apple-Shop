import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_favorite/data/repository/favorite_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  IFavoriteRepository favoriteRepository;

  FavoriteBloc(this.favoriteRepository) : super(FavoriteInit()) {
    on<GetAllFavoriteProducts>(onGetAllFavoriteProducts);
  }

  onGetAllFavoriteProducts(
      GetAllFavoriteProducts event, Emitter<FavoriteState> emit) async {
    var allFavorites = await favoriteRepository.getAllFavorites();

    emit(FavoriteCompleted(allFavorites));
  }
}
