part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
}

// init
class FavoriteInit extends FavoriteState {
  @override
  List<Object> get props => [];
}

// completed
class FavoriteCompleted extends FavoriteState {
  final Either<String, List<ProductModel>> allFavorites;
  const FavoriteCompleted(this.allFavorites);

  @override
  List<Object> get props => [allFavorites];
}
