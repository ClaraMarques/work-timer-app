import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/blocs/auth_bloc.dart';
import 'app/data/models/user_model.dart';
import 'app/locator.dart';
import 'app/ui/views/error_view.dart';
import 'app/ui/views/home_view.dart';
import 'app/ui/views/loading_view.dart';
import 'app/ui/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(WorkTimerApp());
}

class WorkTimerApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Work Timer",
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.purple,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorView(error: snapshot.error);
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _getViewBasedOnAuthState();
          }
          return LoadingView();
        },
      ),
    );
  }

  Widget _getViewBasedOnAuthState() {
    return StreamBuilder<User>(
      stream: locator.get<AuthBloc>().user$,
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasError) {
          return ErrorView(error: snapshot.error);
        }

        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data != User.empty) {
            return Provider<User>.value(
              value: snapshot.data,
              child: HomeView(),
            );
          } else {
            return LoginView();
          }
        }

        return LoadingView();
      },
    );
  }
}
