import '../../models/user_model.dart';
import '../../models/workday_model.dart';

abstract class DatabaseInterface {
  Future createUser(User user);
  Future<User> getUser(String uid);
  Future<WorkdayModel> createWorkday();
  Future<void> addWorkday(WorkdayModel wd);
  Future<List<WorkdayModel>> getWorkdayList();
}
