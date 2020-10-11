import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class IntervalModel extends Equatable {
  final DateTime start;
  final DateTime end;
  String id;

  IntervalModel({
    @required this.start,
    @required this.end,
  }) : assert(start != null, end != null);

  IntervalModel.fromJson(Map<String, dynamic> json)
      : id = json['intervalId'],
        start = DateTime.fromMillisecondsSinceEpoch(json['start']),
        end = DateTime.fromMillisecondsSinceEpoch(json['end']);

  Map<String, dynamic> toJson() {
    return {
      'start': this.start.millisecondsSinceEpoch,
      'end': this.end.millisecondsSinceEpoch,
      'intervalId': this.id
    };
  }

  double get elapsedTime {
    return end.difference(start).inMilliseconds / 3600000;
  }

  @override
  List<Object> get props => [start, end];
}
