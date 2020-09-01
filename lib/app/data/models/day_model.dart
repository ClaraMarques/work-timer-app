import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:work_timer_app/app/data/models/time_interval_model.dart';

class DayModel extends Equatable {
  final DateTime _date;
  final List<TimeIntervalModel> timeIntervalList;
  double totalWorked;

  DayModel(this._date, this.timeIntervalList) {
    totalWorked = 0.0;
    if (timeIntervalList.isNotEmpty) {
      for (TimeIntervalModel interval in timeIntervalList) {
        totalWorked += interval.elapsedTime;
      }
    }
  }

  String get date {
    return DateFormat.MMMMd().format(_date);
  }

  int get intervalNum => timeIntervalList.length;

  @override
  List<Object> get props => [_date, timeIntervalList, totalWorked];
}
