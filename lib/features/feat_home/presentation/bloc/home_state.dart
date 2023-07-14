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
  const HomeCompleted(this.banners);

  @override
  List<Object> get props => [banners];
}
