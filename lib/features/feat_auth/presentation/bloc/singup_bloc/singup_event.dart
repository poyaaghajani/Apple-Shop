part of 'singup_bloc.dart';

abstract class SingupEvent extends Equatable {
  const SingupEvent();
}

// singUp button pressed
class SingupPressed extends SingupEvent {
  final String username;
  final String password;
  final String passwordConfirm;

  const SingupPressed({
    required this.username,
    required this.password,
    required this.passwordConfirm,
  });

  @override
  List<Object> get props => [];
}
