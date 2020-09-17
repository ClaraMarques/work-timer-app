import 'package:flutter/material.dart';

import '../../blocs/workday_bloc.dart';
import '../../data/models/workday_model.dart';
import '../../locator.dart';

class PlayPauseButtonWidget extends StatelessWidget {
  Widget _child;
  final double size;
  final WorkdayModel workdayModel;
  final BuildContext context;

  PlayPauseButtonWidget({this.size, this.workdayModel, this.context}) {
    this._child = this.workdayModel.status == WorkdayStatus.START ||
            this.workdayModel.status == WorkdayStatus.PAUSED
        ? Icon(Icons.play_arrow, color: Theme.of(this.context).primaryColor)
        : Icon(Icons.pause, color: Theme.of(this.context).primaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: OutlineButton(
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        highlightedBorderColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: EdgeInsets.zero,
        onPressed: () => locator.get<WorkdayBloc>().changeStatus(
            workdayModel,
            workdayModel.status == WorkdayStatus.PAUSED ||
                    workdayModel.status == WorkdayStatus.START
                ? WorkdayStatus.IN_PROGRESS
                : WorkdayStatus.PAUSED),
        child: _child,
      ),
    );
  }
}
