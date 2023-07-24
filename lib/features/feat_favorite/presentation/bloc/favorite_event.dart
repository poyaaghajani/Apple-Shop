part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

// get all user favorite products
class GetAllFavoriteProducts extends FavoriteEvent {
  @override
  List<Object> get props => [];
}
