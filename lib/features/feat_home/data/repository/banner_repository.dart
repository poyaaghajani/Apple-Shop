import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat_home/data/datasource/banner_datasource.dart';
import 'package:apple_shop/features/feat_home/data/models/banner_model.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepository {
  Future<Either<String, List<BannerModel>>> getBanners();
}

class BannerRepository extends IBannerRepository {
  IBannerDatasource datasource;
  BannerRepository(this.datasource);

  @override
  Future<Either<String, List<BannerModel>>> getBanners() async {
    try {
      var banner = await datasource.getBanners();
      return right(banner);
    } on ApiExeption catch (ex) {
      return left(ex.message ?? 'مشکلی در سرور پیش آمده');
    }
  }
}
