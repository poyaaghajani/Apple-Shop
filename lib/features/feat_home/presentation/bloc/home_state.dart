part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

// loading
class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

// completed
class HomeCompleted extends HomeState {
  final Either<String, List<BannerModel>> banners;
  final Either<String, List<CategoryModel>> categories;
  final Either<String, List<ProductModel>> hotestProducts;
  final Either<String, List<ProductModel>> bestSellerProducts;

  const HomeCompleted(
    this.banners,
    this.categories,
    this.hotestProducts,
    this.bestSellerProducts,
  );

  @override
  List<Object> get props => [
        banners,
        categories,
        hotestProducts,
        bestSellerProducts,
      ];
}
