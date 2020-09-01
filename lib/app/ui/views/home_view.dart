import 'package:flutter/material.dart';
import 'package:work_timer_app/dummy_data.dart';

import '../widgets/avatar_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
          title: Text('Work Timer'),
          actions: [AvatarWidget()],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Month: '),
                    DropdownButton(
                        hint: Text('August'),
                        items: <String>[
                          'August',
                          'September',
                          'October',
                          'November'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {}),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Group by month'),
                    Checkbox(value: false, onChanged: (_) {})
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.separated(
                  itemCount: daysInfo.listOfDays.length,
                  separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                      ),
                  itemBuilder: (context, index) {
                    final day = daysInfo.listOfDays[index];
                    return ListTile(
                      contentPadding: EdgeInsets.only(right: 50, left: 20),
                      leading: Icon(
                        Icons.alarm_off,
                        color: Colors.white,
                        size: 40,
                      ),
                      title: Text(day.date),
                      trailing: Text(
                        day.totalWorked.toStringAsFixed(2) + 'h',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    );

                    // Container(
                    //   padding: EdgeInsets.zero,
                    //   margin: EdgeInsets.zero,
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //     children: [
                    //       Container(
                    //           width: MediaQuery.of(context).size.width * 0.10,
                    //           child: FittedBox(
                    //             child: Text(daysInfo.listOfDays[index].date),
                    //           )),
                    //       Container(
                    //           width: MediaQuery.of(context).size.width * 0.10,
                    //           child: FittedBox(
                    //             child: Text(daysInfo.listOfDays[index].totalWorked
                    //                     .toStringAsFixed(2) +
                    //                 'h'),
                    //           )),
                    //     ],
                    //   ),
                    // );
                  }),
            ),
          ],
        ));
  }
}
