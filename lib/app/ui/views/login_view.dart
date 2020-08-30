import 'package:flutter/material.dart';
import 'package:work_timer_app/app/blocs/auth_bloc.dart';
import 'package:work_timer_app/app/locator.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.check),
          label: Text("Sign in with Google"),
          onPressed: locator.get<AuthBloc>().loginWithGoogle,
        ),
      ),
    );
  }
}
