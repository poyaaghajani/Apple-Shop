part of 'singup_bloc.dart';

abstract class SingupState extends Equatable {
  const SingupState();
}

// init
class SingupInit extends SingupState {
  @override
  List<Object> get props => [];
}

// loading
class SingupLoading extends SingupState {
  @override
  List<Object> get props => [];
}

// completed
class SingupCompleted extends SingupState {
  final Either<String, String> response;

  const SingupCompleted(this.response);

  @override
  List<Object> get props => [];
}
