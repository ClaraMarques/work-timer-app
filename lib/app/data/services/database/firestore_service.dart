import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';
import 'database_interface.dart';

class FirestoreService implements DatabaseInterface {
  final users = FirebaseFirestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      users
          .doc(user.id)
          .set({"name": user.name, "email": user.email, "photo": user.photo});
    } catch (e) {
      print("Failed to create user: $e");
      throw e;
    }
  }

  Future<User> getUser(String uid) async {
    try {
      final userSnapshot = await users.doc(uid).get();
      return User.fromJson(userSnapshot.data());
    } catch (e) {
      print("Failed to get user: $e");
      throw e;
    }
  }
}
