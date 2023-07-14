import 'package:apple_shop/features/feat_home/data/models/banner_model.dart';
import 'package:apple_shop/features/feat_home/data/repository/banner_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IBannerRepository bannerRepository;
  HomeBloc(this.bannerRepository) : super(HomeLoading()) {
    on<HomeRequest>(onHomeRequest);
  }

  onHomeRequest(HomeRequest event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var banners = await bannerRepository.getBanners();

    emit(HomeCompleted(banners));
  }
}
