import 'package:rxdart/rxdart.dart';

import '../data/models/interval_model.dart';
import '../data/models/workday_model.dart';
import '../data/services/database/database_interface.dart';
import '../locator.dart';

// Bloc para manusear o dia atual
class WorkdayBloc {
  BehaviorSubject<WorkdayModel> _workdaySubject;
  DateTime _currentIntervalStartTime;
  List<WorkdayModel> daysInfo;

  // Adiciona o dia atual na lista de dummy data, no futurodeve adicionar na lista de workdays do usuario vinda do firestore
  WorkdayBloc() {
    final today = WorkdayModel(
        today: true,
        workdayId: 10,
        date: DateTime.now(),
        intervals: [],
        status: WorkdayStatus.START);
    var t;
    try {
      t = locator.get<DatabaseInterface>().createWorkday();
    } catch (e) {
      print(e);
    }
    //_db.getWorkdayList().then((value) => this.daysInfo = value);
    this.daysInfo = [];
    this.daysInfo.add(t);
    this._workdaySubject = BehaviorSubject.seeded(today);
  }

  Stream<WorkdayModel> get workday$ => _workdaySubject.stream;

  void changeStatus(WorkdayModel workday, WorkdayStatus newStatus) {
    workday.status = newStatus;
    if (newStatus == WorkdayStatus.IN_PROGRESS) {
      _currentIntervalStartTime = DateTime.now();
    } else if (newStatus == WorkdayStatus.PAUSED) {
      _saveinterval(_currentIntervalStartTime, workday);
      print(workday.hoursWorked);
    } else if (newStatus == WorkdayStatus.DONE) {
      _saveinterval(_currentIntervalStartTime, workday);

      // mandar para o firebase
    }
    _workdaySubject.add(workday);
  }

  void _saveinterval(DateTime startTime, WorkdayModel workday) {
    final intervalCompleted =
        IntervalModel(start: startTime, end: DateTime.now());
    workday.intervals.add(intervalCompleted);
  }
}
