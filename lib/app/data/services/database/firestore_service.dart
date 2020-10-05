import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_timer_app/app/data/models/workday_model.dart';
import 'package:work_timer_app/app/data/services/auth/auth_interface.dart';
import 'package:work_timer_app/app/locator.dart';

import '../../models/user_model.dart';
import 'database_interface.dart';

class FirestoreService implements DatabaseInterface {
  final users = FirebaseFirestore.instance.collection("users");

  Future createUser(User user) async {
    try {
      users
          .doc(user.id)
          .set({"name": user.name, "email": user.email, "photo": user.photo});
      users.doc(user.id).collection("workdayList");
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

  Future<WorkdayModel> createWorkday() async {
    final today = WorkdayModel(
        today: true,
        date: DateTime.now(),
        intervals: [],
        status: WorkdayStatus.START);
    try {
      final document = await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .add(today.toJson());
      print(document);
      today.workdayId = document.id;
      final d = users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(document.id);

      d.update(today.toJson());
      return d.get().then((value) => WorkdayModel.fromJson(value.data()));
    } catch (e) {
      print("Failed to create work day: $e");
      throw e;
    }
  }

  Future<void> addWorkday(WorkdayModel wd) async {
    try {
      users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(wd.workdayId)
          .set(wd.toJson());
    } catch (e) {
      print("Failed to add work day: $e");
      throw e;
    }
  }

  Future<List<WorkdayModel>> getWorkdayList() async {
    try {
      final snapshot = await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .get();
      return snapshot.docs.map((e) => WorkdayModel.fromJson(e.data())).toList();
    } catch (e) {
      print("Failed to get work day list: $e");
      throw e;
    }
  }
}
