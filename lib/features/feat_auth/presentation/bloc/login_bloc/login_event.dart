part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

// login button pressed
class LoginPressed extends LoginEvent {
  final String identity;
  final String password;

  const LoginPressed({required this.identity, required this.password});

  @override
  List<Object?> get props => [];
}
