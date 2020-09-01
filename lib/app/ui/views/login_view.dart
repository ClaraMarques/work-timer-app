import 'package:flutter/material.dart';
import 'package:work_timer_app/app/blocs/auth_bloc.dart';
import 'package:work_timer_app/app/locator.dart';
import 'package:work_timer_app/app/ui/widgets/custom_stream_builder.dart';

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
          icon: _buildIconWithLoading(),
          label: Text("Sign in with Google"),
          onPressed: locator.get<AuthBloc>().loginWithGoogle,
        ),
      ),
    );
  }

  Widget _buildIconWithLoading() {
    return CustomStreamBuilder<bool>(
      stream: locator.get<AuthBloc>().loading$,
      errorBuilder: (context, snapshot) => Icon(Icons.error),
      waitingBuilder: (context, snapshot) => Container(),
      activeBuilder: (context, snapshot) => snapshot.data
          ? SizedBox(width: 16, height: 16, child: CircularProgressIndicator())
          : Icon(Icons.check),
    );
  }
}
