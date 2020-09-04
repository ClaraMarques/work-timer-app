import 'package:flutter/material.dart';
import 'package:work_timer_app/app/data/dummy_data.dart';
import 'package:work_timer_app/app/ui/widgets/workday_tile_widget.dart';

class WorkdaysListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
      itemCount: daysInfo.length,
      itemBuilder: (context, index) => WorkdayTile(daysInfo[index]),
    );
  }
}
