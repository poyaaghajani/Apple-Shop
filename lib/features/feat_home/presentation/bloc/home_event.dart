part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

// home loading request
class HomeRequest extends HomeEvent {
  @override
  List<Object> get props => [];
}
