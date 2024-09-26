import 'package:contact_list/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<LoginButtonPressed>(onLogin);
  }

  Future<void> onLogin(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    final email = event.email;
    final password = event.password;

    emit(LoginLoading());

    final result = await _loginUseCase.login(email: email, password: password);

    if(result is DataStateSuccess) {
      emit(LoginSuccess(user: result.data!));
    }

    if(result is DataStateException) {
      emit(LoginFailure(message: result.exception));
    }
  }
}
