import 'models/interval_model.dart';
import 'models/workday_model.dart';

List<IntervalModel> intervals1 = [
  IntervalModel(
    start: DateTime(2020, 8, 12, 10),
    end: DateTime(2020, 8, 12, 12, 30),
  ),
  IntervalModel(
    start: DateTime(2020, 8, 12, 7),
    end: DateTime(2020, 8, 12, 9),
  ),
  IntervalModel(
    start: DateTime(2020, 8, 12, 13),
    end: DateTime(2020, 8, 12, 13, 30),
  ),
];

List<IntervalModel> intervals2 = [
  IntervalModel(
    start: DateTime(2020, 8, 14, 10),
    end: DateTime(2020, 8, 14, 12, 30),
  ),
  IntervalModel(
    start: DateTime(2020, 8, 14, 7),
    end: DateTime(2020, 8, 14, 9, 45),
  ),
  IntervalModel(
    start: DateTime(2020, 8, 14, 13),
    end: DateTime(2020, 8, 14, 15, 30),
  ),
];

List<IntervalModel> intervals3 = [
  IntervalModel(
    start: DateTime(2020, 9, 1, 10),
    end: DateTime(2020, 9, 1, 12),
  ),
  IntervalModel(
    start: DateTime(2020, 9, 1, 8),
    end: DateTime(2020, 9, 1, 9, 45),
  ),
  IntervalModel(
    start: DateTime(2020, 9, 1, 13),
    end: DateTime(2020, 9, 1, 16, 30),
  ),
  IntervalModel(
    start: DateTime(2020, 9, 1, 16, 45),
    end: DateTime(2020, 9, 1, 17, 30),
  ),
];

List<IntervalModel> intervals4 = [
  IntervalModel(
    start: DateTime(2020, 9, 3, 13),
    end: DateTime(2020, 9, 3, 18),
  ),
];

final day1 = WorkdayModel(
  workdayId: 1,
  date: DateTime(2020, 8, 31),
  intervals: intervals1,
  status: WorkdayStatus.DONE,
);
final day2 = WorkdayModel(
  workdayId: 2,
  date: DateTime(2020, 9, 1),
  intervals: intervals2,
  status: WorkdayStatus.DONE,
);
final day3 = WorkdayModel(
  workdayId: 3,
  date: DateTime(2020, 9, 2),
  intervals: intervals3,
  status: WorkdayStatus.DONE,
);
final day4 = WorkdayModel(
    workdayId: 4,
    date: DateTime(2020, 9, 3),
    intervals: intervals4,
    status: WorkdayStatus.DONE);

final daysInfo = <WorkdayModel>[day1, day2, day3, day4];
