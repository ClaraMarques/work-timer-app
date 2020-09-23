import '../../models/user_model.dart';

abstract class DatabaseInterface {
  Future createUser(User user);
  Future<User> getUser(String uid);
}
