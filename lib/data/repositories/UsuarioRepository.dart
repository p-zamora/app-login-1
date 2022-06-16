// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, file_names

import 'package:apppzl/domain/entities/Usuario.dart';
import 'package:apppzl/data/datasources/remote/usuario/IUsuarioService.dart';
import 'package:apppzl/domain/repositories/IUsuarioRepository.dart';

class UsuarioRepository implements IUsuarioRepository{
  final IUsuarioService usuarioService;

  UsuarioRepository({required this.usuarioService}); 

  @override
  Future<Usuario> validateUser(Usuario params) async{
    return await usuarioService.validateUser(params);
  }
}