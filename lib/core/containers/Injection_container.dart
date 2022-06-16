// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, import_of_legacy_library_into_null_safe, prefer_const_constructors, sort_child_properties_last

import 'package:apppzl/domain/usecases/usuario/registrarUseCase.dart';
import 'package:apppzl/views/bloc/registrar/registrar_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:apppzl/core/network/networkInfo.dart';
import 'package:apppzl/core/network/networkInfoImpl.dart';
import 'package:http/http.dart' as http;

import 'package:apppzl/views/bloc/login/login_bloc.dart';
import 'package:apppzl/domain/usecases/usuario/loginUseCase.dart';
import 'package:apppzl/domain/repositories/IUsuarioRepository.dart';
import 'package:apppzl/data/repositories/UsuarioRepository.dart';
import 'package:apppzl/data/datasources/remote/usuario/IUsuarioService.dart';
import 'package:apppzl/data/datasources/remote/usuario/UsuarioService.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';




GetIt locator = GetIt.instance;

Future<void> init() async{
  // Registering Blocs
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => RegistrarBloc(locator()));

  // Registering Use Case
  locator.registerLazySingleton(() => LoginUseCase(usuarioRepository: locator()));
  locator.registerLazySingleton(() => RegistrarUseCase(usuarioRepository: locator()));

  // Registering Repositories
  locator.registerLazySingleton<IUsuarioRepository>(() => UsuarioRepository(usuarioService: locator()));

  // Registering Datasources
  locator.registerLazySingleton<IUsuarioService>(() => UsuarioService(client: locator()));

  //Registering Core
  locator.registerLazySingleton<NetWorkInfo>(() => NetWorkInfoImpl(connectionChecker: locator()));
  
  //External Components
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => InternetConnectionChecker());

}