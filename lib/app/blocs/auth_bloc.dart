import 'package:rxdart/rxdart.dart';
import 'package:work_timer_app/app/data/services/auth/auth_service.dart';

import '../data/models/user_model.dart';

class AuthBloc {
  BehaviorSubject<User> _userSubject;
  AuthService _authService;

  AuthBloc(AuthService authenticationService) {
    assert(authenticationService != null);
    this._authService = authenticationService;
    this._userSubject = BehaviorSubject<User>.seeded(_authService.loggedUser);
  }

  Stream<User> get user$ => _userSubject.stream;

  Future<void> loginWithGoogle() async {
    final user = await _authService.loginWithGoogle();
    _userSubject.add(user);
  }

  void dispose() {
    _userSubject.close();
  }
}
