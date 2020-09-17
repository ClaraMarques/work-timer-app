import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import 'workday_tile_widget.dart';

class WorkdaysListWidget extends StatefulWidget {
  @override
  _WorkdaysListWidgetState createState() => _WorkdaysListWidgetState();
}

class _WorkdaysListWidgetState extends State<WorkdaysListWidget> {
  @override
  void initState() {
    super.initState();
  }

  // itemBuilder constroi os tiles em ordem reversa
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
      itemCount: daysInfo.length,
      itemBuilder: (context, index) =>
          WorkdayTile(daysInfo[daysInfo.length - 1 - index]),
    );
  }
}
