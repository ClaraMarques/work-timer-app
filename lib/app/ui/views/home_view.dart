import 'package:flutter/material.dart';

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
      body: Center(
        child: Text("Home!"),
      ),
    );
  }
}
