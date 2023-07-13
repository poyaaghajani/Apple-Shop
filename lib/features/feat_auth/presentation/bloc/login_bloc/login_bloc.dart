import 'package:apple_shop/core/params/auth_params.dart';
import 'package:apple_shop/features/feat_auth/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  IAuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInit()) {
    on<LoginPressed>(onLoginPressed);
  }

  onLoginPressed(LoginPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    var response = await authRepository.logIn(AuthParams(
      identity: event.identity,
      password: event.password,
    ));

    emit(LoginCompleted(response));
  }
}
