import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_timer_app/app/data/models/workday_model.dart';

class WorkdayTile extends StatelessWidget {
  final WorkdayModel workday;

  WorkdayTile(this.workday);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Container(height: double.infinity, child: _buildStatus()),
        title: Text(workday.dateString),
        subtitle: Text(workday.weekday),
        trailing: _buildTrailing(context),
      ),
    );
  }

  Widget _buildStatus() {
    if (workday.status == WorkdayStatus.START) {
      return SvgPicture.asset("assets/images/start_icon.svg", width: 30);
    } else if (workday.status == WorkdayStatus.IN_PROGRESS) {
      return CircularProgressIndicator();
    } else {
      return SvgPicture.asset(
        "assets/images/done.svg",
        width: 30,
      );
    }
  }

  Widget _buildTrailing(BuildContext context) {
    if (workday.status == WorkdayStatus.START) {
      return IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: () {},
        color: Theme.of(context).primaryColor,
      );
    } else if (workday.status == WorkdayStatus.IN_PROGRESS) {
      return IconButton(
        icon: Icon(Icons.play_arrow),
        onPressed: () {},
      );
    } else {
      return CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: 24,
        child: FittedBox(
          child: Text("4.8", style: TextStyle(color: Colors.white)),
        ),
      );
    }
  }
}
