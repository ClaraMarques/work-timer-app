import 'package:work_timer_app/app/data/models/day_model.dart';
import 'package:work_timer_app/app/data/models/list_of_days_model.dart';
import 'package:work_timer_app/app/data/models/time_interval_model.dart';

List<TimeIntervalModel> intervals1 = [
  TimeIntervalModel(
    startTime: DateTime(2020, 8, 12, 10),
    currentTime: DateTime(2020, 8, 12, 12, 30),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 8, 12, 7),
    currentTime: DateTime(2020, 8, 12, 9),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 8, 12, 13),
    currentTime: DateTime(2020, 8, 12, 13, 30),
  ),
];

List<TimeIntervalModel> intervals2 = [
  TimeIntervalModel(
    startTime: DateTime(2020, 8, 14, 10),
    currentTime: DateTime(2020, 8, 14, 12, 30),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 8, 14, 7),
    currentTime: DateTime(2020, 8, 14, 9, 45),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 8, 14, 13),
    currentTime: DateTime(2020, 8, 14, 15, 30),
  ),
];

List<TimeIntervalModel> intervals3 = [
  TimeIntervalModel(
    startTime: DateTime(2020, 9, 1, 10),
    currentTime: DateTime(2020, 9, 1, 12),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 9, 1, 8),
    currentTime: DateTime(2020, 9, 1, 9, 45),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 9, 1, 13),
    currentTime: DateTime(2020, 9, 1, 16, 30),
  ),
  TimeIntervalModel(
    startTime: DateTime(2020, 9, 1, 16, 45),
    currentTime: DateTime(2020, 9, 1, 17, 30),
  ),
];

List<TimeIntervalModel> intervals4 = [
  TimeIntervalModel(
    startTime: DateTime(2020, 9, 3, 13),
    currentTime: DateTime(2020, 9, 3, 18),
  ),
];

final day1 = DayModel(DateTime(2020, 8, 12), intervals1);
final day2 = DayModel(DateTime(2020, 8, 14), intervals2);
final day3 = DayModel(DateTime(2020, 9, 1), intervals3);
final day4 = DayModel(DateTime(2020, 9, 3), intervals4);

final daysInfo = ListOfDaysModel(
    [day1, day2, day3, day4, day1, day2, day3, day4, day1, day2, day3, day4]);
