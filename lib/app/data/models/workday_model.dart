import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'interval_model.dart';

enum WorkdayStatus { IN_PROGRESS, DONE, START }

class WorkdayModel {
  final List<IntervalModel> intervals;
  final DateTime date;
  double hoursWorked;
  String dateString;
  String weekday;
  WorkdayStatus status;

  WorkdayModel({
    @required this.date,
    @required this.intervals,
    @required this.status,
  }) {
    this.dateString = DateFormat.MMMMd().format(this.date);
    this.weekday = DateFormat.EEEE().format(this.date);

    this.hoursWorked = intervals.fold<double>(
        0, (acc, interval) => acc + interval.elapsedTime);
  }
}
