import 'package:apple_shop/features/feat-payment/presentation/bloc/payment_bloc.dart';
import 'package:apple_shop/features/feat-payment/presentation/utils/payment_handler.dart';
import 'package:apple_shop/features/feat-product/data/datasource/product_datasource.dart';
import 'package:apple_shop/features/feat-product/data/repository/product_repository.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/product_popularity/product_popularity_bloc.dart';
import 'package:apple_shop/features/feat_auth/data/datasource/auth_datasource.dart';
import 'package:apple_shop/features/feat_auth/data/repository/auth_repository.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/singup_bloc/singup_bloc.dart';
import 'package:apple_shop/features/feat_basket/data/datasource/basket_datasource.dart';
import 'package:apple_shop/features/feat_basket/data/repository/basket_repository.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/add_basket/add_basket_bloc.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/get_basket/get_basket_bloc.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/remove_basket/remove_basket_bloc.dart';
import 'package:apple_shop/features/feat_category/data/datasource/category_datasource.dart';
import 'package:apple_shop/features/feat_category/data/repository/category_repository.dart';
import 'package:apple_shop/features/feat_category/presentation/bloc/category/category_bloc.dart';
import 'package:apple_shop/features/feat_category/presentation/bloc/category_detail/category_detail_bloc.dart';
import 'package:apple_shop/features/feat_comment/data/datasource/comment_datasource.dart';
import 'package:apple_shop/features/feat_comment/data/repository/comment_repository.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/add_comment/add_comment_bloc.dart';
import 'package:apple_shop/features/feat_comment/presentation/bloc/get_comment/get_comment_bloc.dart';
import 'package:apple_shop/features/feat_favorite/data/datasource/favorite_datasource.dart';
import 'package:apple_shop/features/feat_favorite/data/repository/favorite_repository.dart';
import 'package:apple_shop/features/feat_favorite/presentation/bloc/favorite_bloc.dart';
import 'package:apple_shop/features/feat_home/data/datasource/banner_datasource.dart';
import 'package:apple_shop/features/feat_home/data/repository/banner_repository.dart';
import 'package:apple_shop/features/feat_home/presentation/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> getInit() async {
  // components
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(
      baseUrl: 'http://startflutter.ir/api/',
      // headers: {
      //   'Authorization':
      //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE2OTgyNjY2NjEsImlkIjoicDc3aG96dWthcGo5ZW1xIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.f1QgUc56CcvfkaIBCMgoKs7vUMqJ2fCQKJ0sIoDaBQo',
      // },
    ),
  ));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  locator.registerSingleton<PaymentHandler>(ZarinpalPayment());

  // datasource
  locator.registerSingleton<IAuthDatasource>(
    AuthDatasource(locator()),
  );
  locator.registerSingleton<IBannerDatasource>(
    BannerRemoteDatasource(locator()),
  );
  locator.registerSingleton<ICategoryDatasource>(
    CategoryRemoteDatasource(locator()),
  );
  locator.registerSingleton<IProductDatasource>(
    ProductRemoteDatasource(locator()),
  );
  locator.registerSingleton<IBasketDatasource>(
    BasketLocalDatasource(),
  );
  locator.registerSingleton<IFavoriteDatasource>(
    FavoriteLocalDatasource(),
  );
  locator.registerSingleton<ICommentDatasource>(
    CommentRemoteDatasource(locator()),
  );

  // repository
  locator.registerSingleton<IAuthRepository>(
    AuthRepository(locator()),
  );
  locator.registerSingleton<IBannerRepository>(
    BannerRepository(locator()),
  );
  locator.registerSingleton<ICategoryRepository>(
    CategoryRepository(locator()),
  );
  locator.registerSingleton<IProductRepository>(
    ProductRepository(locator()),
  );
  locator.registerSingleton<IBasketRepository>(
    BasketRepository(locator()),
  );
  locator.registerSingleton<IFavoriteRepository>(
    FavoriteRepository(locator()),
  );
  locator.registerSingleton<ICommentRepository>(
    CommentRepository(locator()),
  );

  // blocs
  locator.registerFactory<LoginBloc>(
    () => LoginBloc(locator()),
  );
  locator.registerFactory<SingupBloc>(
    () => SingupBloc(locator()),
  );
  locator.registerFactory<HomeBloc>(
    () => HomeBloc(locator(), locator(), locator()),
  );
  locator.registerFactory<CategoryBloc>(
    () => CategoryBloc(locator()),
  );
  locator.registerFactory<CategoryDetalBloc>(
    () => CategoryDetalBloc(locator()),
  );
  locator.registerFactory<ProductDetailBloc>(
    () => ProductDetailBloc(locator(), locator()),
  );
  locator.registerFactory<ProductPopularityBloc>(
    () => ProductPopularityBloc(locator()),
  );
  locator.registerFactory<AddBasketBloc>(
    () => AddBasketBloc(locator()),
  );
  locator.registerSingleton<GetBasketBloc>(
    (GetBasketBloc(locator())),
  );
  locator.registerSingleton<RemoveBasketBloc>(
    (RemoveBasketBloc(locator())),
  );
  locator.registerSingleton<PaymentBloc>(
    (PaymentBloc(locator())),
  );
  locator.registerSingleton<FavoriteBloc>(
    (FavoriteBloc(locator())),
  );
  locator.registerFactory<GetCommentBloc>(
    () => (GetCommentBloc(locator())),
  );
  locator.registerFactory<AddCommentBloc>(
    () => AddCommentBloc(locator()),
  );
}
