import 'package:apppzl/domain/entities/Usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apppzl/domain/usecases/usuario/loginUseCase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is OnSubmit) {
      yield* this._onSubmit(event);
    }
  }

  Stream<LoginState> _onSubmit(LoginEvent event) async* {
    yield state.copyWith(
      isLoading : true, 
      isFailure : false, 
      isSuccess : false
    );

    try {
      //Your code
      Usuario params = new Usuario();
      Usuario usuario = await loginUseCase.call(params);
    } catch (error) {
      yield state.copyWith(
        isLoading : true, 
        isFailure : false, 
        isSuccess : false
      );
    }
  }
}
