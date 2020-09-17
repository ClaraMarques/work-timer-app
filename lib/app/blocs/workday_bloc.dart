import 'package:rxdart/rxdart.dart';

import '../data/dummy_data.dart';
import '../data/models/interval_model.dart';
import '../data/models/workday_model.dart';

// Bloc para manusear o dia atual
class WorkdayBloc {
  BehaviorSubject<WorkdayModel> _workdaySubject;
  DateTime _currentIntervalStartTime;

  // Adiciona o dia atual na lista de dummy data, no futurodeve adicionar na lista de workdays do usuario vinda do firestore
  WorkdayBloc() {
    final today = WorkdayModel(
        today: true,
        workdayId: 10,
        date: DateTime.now(),
        intervals: [],
        status: WorkdayStatus.START);
    daysInfo.add(today);
    this._workdaySubject = BehaviorSubject.seeded(today);
  }

  Stream<WorkdayModel> get workday$ => _workdaySubject.stream;

  void changeStatus(WorkdayModel workday, WorkdayStatus newStatus) {
    final updatedWorkday = workday;
    if (newStatus == WorkdayStatus.IN_PROGRESS) {
      _currentIntervalStartTime = DateTime.now();
    } else if (newStatus == WorkdayStatus.PAUSED) {
      final intervalCompleted =
          IntervalModel(start: _currentIntervalStartTime, end: DateTime.now());
      updatedWorkday.intervals.add(intervalCompleted);
    }
    updatedWorkday.status = newStatus;
    _workdaySubject.add(updatedWorkday);
  }
}
