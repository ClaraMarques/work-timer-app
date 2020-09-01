import 'package:equatable/equatable.dart';
import 'package:work_timer_app/app/data/models/day_model.dart';

class ListOfDaysModel extends Equatable {
  final List<DayModel> listOfDays;
  ListOfDaysModel(this.listOfDays);

  @override
  List<Object> get props => [listOfDays];
}
