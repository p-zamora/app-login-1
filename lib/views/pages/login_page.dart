// ignore_for_file: unnecessary_new, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:apppzl/views/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apppzl/views/bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _loginBloc;

  final _emailController = new TextEditingController();
  final _passWordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passWordController.addListener(_onPasswordChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {}

        if (state.isSuccess) {}
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state.isLoading) {}

          return _crearBody(state);
        },
      ),
    );
  }

  Widget _crearBody(LoginState state) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.only(top: 0),
      physics: BouncingScrollPhysics(),
      children: [
        Stack(
          children: [HeaderLoginWidget(), _crearLogo()],
        ),
        _crearTitulo(),
        SizedBox(height: 40.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              _crearInputEmail(state),
              SizedBox(height: 20.0),
              _crearInputPassword(state),
            ],
          ),
        ),
        _crearTextoOlvidarContrasenia(),
        SizedBox(height: 40.0),
        _crearBoton(),
      ],
    ));
  }

  Widget _crearLogo() {
    return Positioned(
      top: 80.0,
      left: MediaQuery.of(context).size.width * 0.38,
      child: Container(
        height: 80.0,
        width: 80.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black26)]),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'PZL',
            style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Row(children: [
        Text('Iniciar Sesión',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        Text('/', style: TextStyle(fontSize: 25.0, color: Colors.grey)),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'registrar');
          },
          child: Text(
            'Registrar',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ),
      ]),
    );
  }

  Widget _crearInputEmail(LoginState state) {
    return TextField(
      controller: _emailController,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: true,
      style: TextStyle(fontSize: 17.2),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(2, 2, 5, 5),
          hintText: '',
          hintStyle: TextStyle(
            height: 1.2,
          ),
          labelStyle: TextStyle(height: 1.3, fontWeight: FontWeight.w500),
          labelText: 'Email',
          errorText: state.isInvalidEmail ? 'Correo inválido' : null),
    );
  }

  Widget _crearInputPassword(LoginState state) {
    return TextField(
      controller: _passWordController,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: true,
      style: TextStyle(fontSize: 17.2),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(2, 2, 5, 5),
          hintText: '',
          hintStyle: TextStyle(
            height: 1.2,
          ),
          labelStyle: TextStyle(height: 1.3, fontWeight: FontWeight.w500),
          labelText: 'Contraseña',
          errorText: state.isInvalidPassword ? 'Contraseña inválida': null),
    );
  }

  Widget _crearTextoOlvidarContrasenia(){
    return Container(
      padding: EdgeInsets.only(right: 25.0, top: 20.0),
      alignment: Alignment.centerRight,
      child: Text('¿Olvidaste tu contraseña?'),
    );
  }

  Widget _crearBoton() {
    return Container(
      margin: EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 68, 129, 1.0),
        borderRadius: BorderRadius.circular(50.0)
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Ingresar',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
    );
  }

  void _onEmailChanged() {
    _loginBloc.add(OnChangeEmail(_emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(OnChangePassword(_passWordController.text));
  }
}
