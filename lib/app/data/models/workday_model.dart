import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'interval_model.dart';

enum WorkdayStatus { IN_PROGRESS, DONE, START, PAUSED }

// adicionado um atributo para saber se é o dia de hoje
// workdayId para quando for criar um documento no firestore
class WorkdayModel {
  String workdayId;
  final today;
  List<IntervalModel> intervals;
  final DateTime date;

  double hoursWorked;
  String dateString;
  String weekday;
  WorkdayStatus status;

  WorkdayModel({
    this.today = false,
    this.workdayId,
    @required this.date,
    this.intervals,
    @required this.status,
  }) {
    initializeProperties();
  }
// TODO: intervals deveria ser uma colecao, e aqui teriamos o id dessa colecao
  WorkdayModel.fromJson(Map<String, dynamic> json)
      : today = json['today'],
        workdayId = json['workdayId'],
        date = DateTime.fromMillisecondsSinceEpoch(json['date']),
        status = WorkdayStatus.values[json['status']] {
    initializeProperties();
  }

  void initializeProperties() {
    this.dateString = DateFormat.MMMMd().format(this.date);
    this.weekday = DateFormat.EEEE().format(this.date);

    this.hoursWorked = intervals == null
        ? 0.0
        : intervals.fold<double>(
            0, (acc, interval) => acc + interval.elapsedTime);
  }

  Map<String, dynamic> toJson() {
    return {
      'today': this.today,
      'workdayId': this.workdayId,
      'date': this.date.millisecondsSinceEpoch,
      'status': this.status.index
    };
  }
}
