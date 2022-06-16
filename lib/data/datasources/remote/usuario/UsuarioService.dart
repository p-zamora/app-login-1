// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last, prefer_interpolation_to_compose_strings, file_names

import 'dart:convert';
import 'package:apppzl/core/constants/WsConstants.dart';
import 'package:apppzl/domain/entities/MessageError.dart';
import 'package:http/http.dart' as http;
import 'package:apppzl/domain/entities/Usuario.dart';
import 'package:apppzl/data/datasources/remote/usuario/IUsuarioService.dart';

class UsuarioService implements IUsuarioService {
  final http.Client client;

  UsuarioService({ required this.client});

  @override
  Future<Usuario> validateUser(Usuario params) async {
    final response = await client.post(
      Uri(path: WSConstants.api_url + "validate"),        
        body: jsonEncode(params.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${params.token}'
        });

    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      final responseJson = Usuario.fromJsonError(json.decode(utf8.decode(response.bodyBytes)));

      MessageError? messageError = responseJson.message;

      throw Exception(messageError!.description);
    }
  }
}
