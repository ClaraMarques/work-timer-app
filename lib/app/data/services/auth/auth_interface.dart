import 'package:work_timer_app/app/data/models/user_model.dart';

abstract class AuthInterface {
  User get loggedUser;
  Future<User> loginWithGoogle();
}
