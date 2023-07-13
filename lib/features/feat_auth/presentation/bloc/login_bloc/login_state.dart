part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

// init
class LoginInit extends LoginState {
  @override
  List<Object?> get props => [];
}

// loading
class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

// completed
class LoginCompleted extends LoginState {
  final Either<String, String> response;

  const LoginCompleted(this.response);

  @override
  List<Object?> get props => [response];
}
