import 'package:apppzl/domain/entities/Usuario.dart';

abstract class IUsuarioService {
  Future<Usuario> validateUser(Usuario params);
}