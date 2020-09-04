import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class IntervalModel extends Equatable {
  final DateTime start;
  final DateTime end;

  IntervalModel({
    @required this.start,
    @required this.end,
  }) : assert(start != null, end != null);

  double get elapsedTime {
    return end.difference(start).inMilliseconds / 3600000;
  }

  @override
  List<Object> get props => [start, end];
}
