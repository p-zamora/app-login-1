import 'package:apppzl/domain/entities/Usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apppzl/domain/usecases/usuario/registrarUseCase.dart';

part 'registrar_event.dart';
part 'registrar_state.dart';

class RegistrarBloc extends Bloc<RegistrarEvent, RegistrarState> {
  final RegistrarUseCase registrarUseCase;

  RegistrarBloc(this.registrarUseCase) : super(RegistrarState());

  @override
  Stream<RegistrarState> mapEventToState(RegistrarEvent event) async* {
    if (event is OnSubmit) {
      yield* this._onSubmit(event);
    }
  }

  Stream<RegistrarState> _onSubmit(RegistrarEvent event) async* {
    yield state.copyWith(
      isLoading : true, 
      isFailure : false, 
      isSuccess : false
    );

    try {
      //Your code
      Usuario params = new Usuario();
      Usuario usuario = await registrarUseCase.call(params);
    } catch (error) {
      yield state.copyWith(
        isLoading : true, 
        isFailure : false, 
        isSuccess : false
      );
    }
  }
}
