import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: _onSelected,
      icon: Icon(Icons.filter_list),
      itemBuilder: (_) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'all',
          child: Text("All"),
        ),
        PopupMenuItem<String>(
          value: 'thisMonth',
          child: Text("This month"),
        ),
      ],
    );
  }

  void _onSelected(String value) {
    // if (value == "all") {
    //   bloc.add(FilterEvent.ALL)
    // }
  }
}
