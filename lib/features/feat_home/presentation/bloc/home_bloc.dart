import 'package:apple_shop/features/faet-product/data/models/product_model.dart';
import 'package:apple_shop/features/faet-product/data/repository/product_repository.dart';
import 'package:apple_shop/features/feat_category/data/models/category_model.dart';
import 'package:apple_shop/features/feat_category/data/repository/category_repository.dart';
import 'package:apple_shop/features/feat_home/data/models/banner_model.dart';
import 'package:apple_shop/features/feat_home/data/repository/banner_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IBannerRepository bannerRepository;
  ICategoryRepository categoryRepository;
  IProductRepository productRepository;

  HomeBloc(
    this.bannerRepository,
    this.categoryRepository,
    this.productRepository,
  ) : super(HomeLoading()) {
    on<HomeRequest>(onHomeRequest);
  }

  onHomeRequest(HomeRequest event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var banners = await bannerRepository.getBanners();
    var categories = await categoryRepository.getCategories();
    var hotestProducts = await productRepository.getHotestProducts();
    var bestSellerProducts = await productRepository.getBestSellerProducts();

    emit(HomeCompleted(
      banners,
      categories,
      hotestProducts,
      bestSellerProducts,
    ));
  }
}
