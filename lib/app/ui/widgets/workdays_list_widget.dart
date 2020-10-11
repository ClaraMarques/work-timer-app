import 'package:flutter/material.dart';

import '../../blocs/workday_bloc.dart';
import '../../data/models/workday_model.dart';
import '../../locator.dart';
import 'workday_tile_widget.dart';

class WorkdaysListWidget extends StatefulWidget {
  @override
  _WorkdaysListWidgetState createState() => _WorkdaysListWidgetState();
}

class _WorkdaysListWidgetState extends State<WorkdaysListWidget> {
  WorkdayBloc workdayBloc;
  @override
  void initState() {
    super.initState();
    workdayBloc = locator.get<WorkdayBloc>();
    workdayBloc.setupBloc();
  }

  // itemBuilder constroi os tiles em ordem reversa
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WorkdayModel>>(
      stream: locator.get<WorkdayBloc>().days$,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          final days = snapshot.data;
          return ListView.builder(
            padding: EdgeInsets.only(left: 14.0, right: 14.0, top: 14.0),
            itemCount: days.length,
            itemBuilder: (context, index) => WorkdayTile(days[index]),
          );
        }
      },
    );
  }
}
