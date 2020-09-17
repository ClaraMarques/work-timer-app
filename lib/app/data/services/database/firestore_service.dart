import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user_model.dart';
import 'database_interface.dart';

class FirestoreService implements DatabaseInterface {
  final users = FirebaseFirestore.instance.collection("users");

  Future<bool> createUser(User user) async {
    try {
      users
          .doc(user.id)
          .set({"name": user.name, "email": user.email, "photo": user.photo});
      return true;
    } catch (e) {
      print("Failed to add user: $e");
      return false;
    }
  }

  Future<User> getUser(String uid) async {
    try {
      final userSnapshot = await users.doc(uid).get();
      return User.fromData(userSnapshot.data());
    } catch (e) {
      print("Failed to get user: $e");
      return User.empty;
    }
  }
}
