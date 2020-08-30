import 'package:flutter/material.dart';

class ErrorView extends StatefulWidget {
  @override
  _ErrorViewState createState() => _ErrorViewState();

  // emmited error that caused this view
  final Object error;

  ErrorView({@required this.error});
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).errorColor,
        child: Center(
          child: Text('${widget.error}'),
        ),
      ),
    );
  }
}
