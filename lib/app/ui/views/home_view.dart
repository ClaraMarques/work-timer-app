import 'package:flutter/material.dart';
import 'package:work_timer_app/app/blocs/auth_bloc.dart';
import 'package:work_timer_app/app/data/services/auth/auth_interface.dart';
import 'package:work_timer_app/app/locator.dart';

import '../widgets/avatar_widget.dart';
import '../widgets/workdays_list_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Timer'),
        leading: AvatarWidget(),
        actions: [
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                locator.get<AuthBloc>().logOut();
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text('Month: '),
          //         DropdownButton(
          //             hint: Text('August'),
          //             items: <String>[
          //               'August',
          //               'September',
          //               'October',
          //               'November'
          //             ].map<DropdownMenuItem<String>>((String value) {
          //               return DropdownMenuItem<String>(
          //                 value: value,
          //                 child: Text(value),
          //               );
          //             }).toList(),
          //             onChanged: (_) {}),
          //       ],
          //     ),
          //     Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text('Group by month'),
          //         Checkbox(value: false, onChanged: (_) {})
          //       ],
          //     ),
          //   ],
          // ),
          Expanded(child: WorkdaysListWidget())
        ],
      ),
    );
  }
}
