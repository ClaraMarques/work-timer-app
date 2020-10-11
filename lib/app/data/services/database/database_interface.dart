import '../../models/interval_model.dart';
import '../../models/user_model.dart';
import '../../models/workday_model.dart';

abstract class DatabaseInterface {
  Future createUser(User user);
  Future<void> checkUserInDatabase(String uid);
  Future<void> createWorkday();
  Future<void> addWorkday(WorkdayModel wd);
  Future<List<WorkdayModel>> getWorkdayList();
  Future<void> addInterval(WorkdayModel wd, IntervalModel intervalModel);
  Future<List<IntervalModel>> getIntervalsList(WorkdayModel wd);
  Future<void> updateWorkday(WorkdayModel wd);
}
