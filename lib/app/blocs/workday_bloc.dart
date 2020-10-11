import 'package:rxdart/rxdart.dart';
import 'package:work_timer_app/app/data/services/database/database_interface.dart';
import 'package:work_timer_app/app/locator.dart';

import '../data/models/interval_model.dart';
import '../data/models/workday_model.dart';

// Bloc para manusear o dia atual
class WorkdayBloc {
  DateTime _currentIntervalStartTime;
  BehaviorSubject<List<WorkdayModel>> _daysSubject;
  final firestore = locator.get<DatabaseInterface>();

  // Adiciona o dia atual na lista de dummy data, no futurodeve adicionar na lista de workdays do usuario vinda do firestore
  WorkdayBloc() {
    final today = WorkdayModel(
        today: true,
        date: DateTime.now(),
        intervals: [],
        status: WorkdayStatus.START);
    this._daysSubject = BehaviorSubject.seeded([today]);
  }

  void setupBloc() async {
    final firestore = locator.get<DatabaseInterface>();
    await firestore.createWorkday();
    List<WorkdayModel> workdayList = await firestore.getWorkdayList();
    if (workdayList != null) {
      workdayList = workdayList.reversed.toList();
      _daysSubject.add(workdayList);
    }
  }

  Stream<List<WorkdayModel>> get days$ => _daysSubject.stream;

  void changeStatus(WorkdayModel workday, WorkdayStatus newStatus) async {
    workday.status = newStatus;
    if (newStatus == WorkdayStatus.IN_PROGRESS) {
      _currentIntervalStartTime = DateTime.now();
    } else if (newStatus == WorkdayStatus.PAUSED) {
      _saveinterval(_currentIntervalStartTime, workday);

      print(workday.hoursWorked);
    } else if (newStatus == WorkdayStatus.DONE) {
      _saveinterval(_currentIntervalStartTime, workday);
    }
    firestore.updateWorkday(workday);
    _daysSubject.add((await firestore.getWorkdayList()).reversed.toList());
  }

  void _saveinterval(DateTime startTime, WorkdayModel workday) {
    final intervalCompleted =
        IntervalModel(start: startTime, end: DateTime.now());
    firestore.addInterval(workday, intervalCompleted);
  }
}
