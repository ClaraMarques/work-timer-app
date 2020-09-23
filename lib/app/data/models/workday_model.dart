import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'interval_model.dart';

enum WorkdayStatus { IN_PROGRESS, DONE, START, PAUSED }

// adicionado um atributo para saber se é o dia de hoje
// workdayId para quando for criar um documento no firestore
class WorkdayModel {
  final workdayId;
  final today;
  final List<IntervalModel> intervals;
  final DateTime date;

  double hoursWorked;
  String dateString;
  String weekday;
  WorkdayStatus status;

  WorkdayModel({
    this.today = false,
    @required this.workdayId,
    @required this.date,
    @required this.intervals,
    @required this.status,
  }) {
    initializeProperties();
  }

  WorkdayModel.fromJson(Map<String, dynamic> json)
      : today = json['today'],
        workdayId = json['workdayId'],
        date = json['date'],
        intervals = json['intervals'],
        status = json['status'] {
    initializeProperties();
  }

  void initializeProperties() {
    this.dateString = DateFormat.MMMMd().format(this.date);
    this.weekday = DateFormat.EEEE().format(this.date);

    this.hoursWorked = intervals.fold<double>(
        0, (acc, interval) => acc + interval.elapsedTime);
  }
}
