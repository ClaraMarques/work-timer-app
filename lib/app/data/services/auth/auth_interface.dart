import '../../models/user_model.dart';

abstract class AuthInterface {
  User get loggedUser;
  Future<User> loginWithGoogle();
  Future<void> logOut();
}
