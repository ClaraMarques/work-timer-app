import 'package:flutter/material.dart';

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
        actions: [IconButton(icon: Icon(Icons.filter_list), onPressed: () {})],
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
