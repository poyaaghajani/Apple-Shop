import 'package:apple_shop/core/params/auth_params.dart';
import 'package:apple_shop/features/feat_auth/data/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'singup_event.dart';
part 'singup_state.dart';

class SingupBloc extends Bloc<SingupEvent, SingupState> {
  IAuthRepository authRepository;

  SingupBloc(this.authRepository) : super(SingupInit()) {
    on<SingupPressed>(onSingupPressed);
  }

  onSingupPressed(SingupPressed event, Emitter<SingupState> emit) async {
    emit(SingupLoading());

    var response = await authRepository.singUp(AuthParams(
      username: event.username,
      password: event.password,
      passwordConfirm: event.passwordConfirm,
    ));

    emit(SingupCompleted(response));
  }
}
