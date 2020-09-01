import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TimeIntervalModel extends Equatable {
  final DateTime startTime;
  final DateTime currentTime;
  double elapsedTime;

  TimeIntervalModel({
    @required this.startTime,
    @required this.currentTime,
  }) {
    if (startTime == null || currentTime == null) {
      elapsedTime = 0.0;
    } else {
      final diff = currentTime.difference(startTime).inMilliseconds / 3600000;
      final fraction = (diff * 100).round() / 100;
      elapsedTime = fraction;
    }
  }

  @override
  List<Object> get props => [startTime, currentTime, elapsedTime];
}
