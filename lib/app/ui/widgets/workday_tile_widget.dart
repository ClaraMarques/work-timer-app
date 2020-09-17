import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/workday_bloc.dart';
import '../../data/models/workday_model.dart';
import '../../locator.dart';
import 'custom_list_tile_widget.dart';
import 'play_pause_button_widget.dart';

class WorkdayTile extends StatelessWidget {
  final WorkdayModel workday;

  WorkdayTile(this.workday);

  @override
  Widget build(BuildContext context) {
    if (workday.today) {
      return _buildTodayTile();
    } else {
      return Card(
        elevation: 3,
        child: CustomListTileWidget(
          leading: _buildStatus(context, workday),
          title: workday.dateString,
          subtitle: workday.weekday,
          trailing: _buildTrailing(context, workday),
        ),
      );
    }
  }

// método que possui um stream builder para o dia de hoje, pois ele pode mudar de status
  Widget _buildTodayTile() {
    return StreamBuilder<WorkdayModel>(
        stream: locator.get<WorkdayBloc>().workday$,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Card(
              elevation: 3,
              child: CircularProgressIndicator(),
            );
          } else {
            final workday = snapshot.data;
            return Card(
              elevation: 3,
              child: CustomListTileWidget(
                leading: _buildStatus(context, workday),
                title: workday.dateString,
                subtitle: workday.weekday,
                trailing: _buildTrailing(context, workday),
              ),
            );
          }
        });
  }

  Widget _buildStatus(context, workday) {
    const _statusSize = 35.0;

    if (workday.status == WorkdayStatus.START ||
        workday.status == WorkdayStatus.PAUSED) {
      return SvgPicture.asset(
        "assets/images/start_icon.svg",
        width: _statusSize,
        height: _statusSize,
      );
    } else if (workday.status == WorkdayStatus.IN_PROGRESS) {
      return Container(
        width: _statusSize - 15,
        height: _statusSize - 15,
        child: CircularProgressIndicator(
          valueColor:
              AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.green[700]);
    }
  }

  Widget _buildTrailing(context, workday) {
    final Color color =
        this.workday.hoursWorked < 4 ? Colors.red[700] : Colors.green[700];
    const trailingSize = 42.0;

    if (workday.status == WorkdayStatus.DONE) {
      return Container(
        width: trailingSize,
        height: trailingSize,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(4),
        ),
        child: FittedBox(
          child: Text(
            "${this.workday.hoursWorked}",
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: color,
                  fontSize: 15,
                ),
          ),
        ),
      );
    } else {
      return PlayPauseButtonWidget(
          context: context, size: trailingSize, workdayModel: workday);
    }
  }
}
