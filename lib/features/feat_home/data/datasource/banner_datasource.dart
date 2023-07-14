import 'package:apple_shop/core/utils/api_exeption.dart';
import 'package:apple_shop/features/feat_home/data/models/banner_model.dart';
import 'package:dio/dio.dart';

abstract class IBannerDatasource {
  Future<List<BannerModel>> getBanners();
}

class BannerRemoteDatasource extends IBannerDatasource {
  Dio dio;
  BannerRemoteDatasource(this.dio);

  @override
  Future<List<BannerModel>> getBanners() async {
    try {
      var response = await dio.get('collections/banner/records');
      return response.data['items']
          .map<BannerModel>((jsonObject) => BannerModel.fromJson(jsonObject))
          .toList();
    } on DioError catch (_) {
      throw ApiExeption('لیست بنرها از دسترس خارج شده');
    } catch (_) {
      throw ApiExeption('مشکلی در سرور پیش آمده');
    }
  }
}
