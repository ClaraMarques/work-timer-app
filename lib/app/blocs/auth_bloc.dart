import 'package:rxdart/rxdart.dart';
import 'package:work_timer_app/app/data/services/auth/auth_service.dart';

import '../data/models/user_model.dart';

class AuthBloc {
  BehaviorSubject<User> _userSubject;
  BehaviorSubject<bool> _loadingSubject;
  AuthService _authService;

  AuthBloc(AuthService authenticationService) {
    assert(authenticationService != null);
    this._authService = authenticationService;
    this._userSubject = BehaviorSubject<User>.seeded(_authService.loggedUser);
    this._loadingSubject = BehaviorSubject<bool>.seeded(false);
  }

  Stream<User> get user$ => _userSubject.stream;
  Stream<bool> get loading$ => _loadingSubject.stream;

  Future<void> loginWithGoogle() async {
    _loadingSubject.add(true);
    final user = await _authService.loginWithGoogle();
    _loadingSubject.add(false);

    if (user != User.empty) {
      _userSubject.add(user);
    }
  }

  Future<void> logOut() async {
    _loadingSubject.add(true);
    await _authService.logOut();
    _loadingSubject.add(false);

    _userSubject.add(User.empty);
  }

  void dispose() {
    _userSubject.close();
    _loadingSubject.close();
  }
}
