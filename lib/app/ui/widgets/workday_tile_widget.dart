import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_timer_app/app/ui/widgets/custom_list_tile_widget.dart';

import '../../data/models/workday_model.dart';

class WorkdayTile extends StatelessWidget {
  final WorkdayModel workday;

  WorkdayTile(this.workday);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      // child: ListTile(
      //   leading: Container(height: double.infinity, child: _buildStatus()),
      //   title: Text(workday.dateString),
      //   subtitle: Text(workday.weekday),
      //   trailing: _buildTrailing(context),
      // ),
      child: CustomListTileWidget(
        leading: _buildStatus(context),
        title: workday.dateString,
        subtitle: workday.weekday,
        trailing: _buildTrailing(context),
      ),
    );
  }

  Widget _buildStatus(context) {
    const _statusSize = 35.0;

    if (workday.status == WorkdayStatus.START) {
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

  // TODO: make this _build function a stateful widget => PlayPauseButtonWidget
  Widget _buildTrailingButton(
    BuildContext context,
    Widget child,
    double size,
    VoidCallback onPressed,
  ) {
    return Container(
      width: size,
      height: size,
      child: OutlineButton(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        highlightedBorderColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  Widget _buildTrailing(BuildContext context) {
    final Color color =
        this.workday.hoursWorked < 4 ? Colors.red[700] : Colors.green[700];
    const trailingSize = 42.0;

    if (workday.status == WorkdayStatus.START) {
      return _buildTrailingButton(
        context,
        Icon(Icons.play_arrow, color: Theme.of(context).primaryColor),
        trailingSize,
        () {},
      );
    } else if (workday.status == WorkdayStatus.IN_PROGRESS) {
      return _buildTrailingButton(
        context,
        Icon(Icons.pause, color: Theme.of(context).primaryColor),
        trailingSize,
        () {},
      );
    } else {
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
    }
  }
}
