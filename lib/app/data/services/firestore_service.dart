import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FirestoreService {
  final users = FirebaseFirestore.instance.collection("users");

  Future createUser(User user) async {
    users
        .doc(user.id)
        .set({"name": user.name, "email": user.email, "photo": user.photo})
        .then((value) => print("added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future getUser(String uid) async {
    try {
      final userSnapshot = await users.doc(uid).get();
      return User.fromData(userSnapshot.data());
    } catch (e) {
      print(e.toString());
    }
  }
}
