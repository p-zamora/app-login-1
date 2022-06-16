// ignore_for_file: file_names

import 'package:apppzl/core/usecases/UseCase.dart';
import 'package:apppzl/domain/entities/Usuario.dart';
import 'package:apppzl/domain/repositories/IUsuarioRepository.dart';

class RegistrarUseCase implements UseCase<Usuario, Usuario> {
  final IUsuarioRepository usuarioRepository;

  RegistrarUseCase({required this.usuarioRepository});

  @override
  Future<Usuario> call(Usuario params) async{
    return await usuarioRepository.validateUser(params);
  }

}