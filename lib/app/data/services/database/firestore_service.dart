import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:work_timer_app/app/data/models/interval_model.dart';
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
    } catch (e) {
      print("Failed to create user: $e");
      throw e;
    }
  }

  Future<void> checkUserInDatabase(String uid) async {
    try {
      users.doc(uid);
    } catch (e) {
      print("Failed to get user: $e");
      throw e;
    }
  }

  Future<void> createWorkday() async {
    final today = WorkdayModel(
        today: true, date: DateTime.now(), status: WorkdayStatus.START);
    try {
      final document = await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .add(today.toJson());

      today.workdayId = document.id;
      await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(document.id)
          .update(today.toJson());
    } catch (e) {
      print("Failed to create work day: $e");
      throw e;
    }
  }

  Future<void> addInterval(WorkdayModel wd, IntervalModel intervalModel) async {
    try {
      final document = await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(wd.workdayId)
          .collection('intervals')
          .add(intervalModel.toJson());

      intervalModel.id = document.id;
      final d = users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(wd.workdayId)
          .collection('intervals')
          .doc(intervalModel.id)
          .update(intervalModel.toJson());
    } catch (e) {
      print("Failed to add intervaal model: $e");
      throw e;
    }
  }

  Future<void> addWorkday(WorkdayModel wd) async {
    try {
      final document = await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .add(wd.toJson());

      wd.workdayId = document.id;
      final d = users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(document.id);

      d.update(wd.toJson());
    } catch (e) {
      print("Failed to add work day: $e");
      throw e;
    }
  }

  Future<void> updateWorkday(WorkdayModel wd) async {
    try {
      await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(wd.workdayId)
          .update(wd.toJson());
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

      return snapshot.docs.length == 0
          ? null
          : snapshot.docs.map((e) {
              print(e.data());
              return WorkdayModel.fromJson(e.data());
            }).toList();
    } catch (e) {
      print("Failed to get work day list: $e");
      throw e;
    }
  }

  Future<List<IntervalModel>> getIntervalsList(WorkdayModel wd) async {
    try {
      final snapshot = await users
          .doc(locator.get<AuthInterface>().loggedUser.id)
          .collection("workdayList")
          .doc(wd.workdayId)
          .collection('intervals')
          .get();

      return snapshot.docs.length == 0
          ? null
          : snapshot.docs.map((e) => IntervalModel.fromJson(e.data())).toList();
    } catch (e) {
      print("Failed to get intevals list: $e");
      throw e;
    }
  }
}
