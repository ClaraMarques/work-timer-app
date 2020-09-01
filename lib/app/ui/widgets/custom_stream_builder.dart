import 'package:flutter/material.dart';

class CustomStreamBuilder<T> extends StatelessWidget {
  final Stream<T> _stream;
  final Widget Function(BuildContext, AsyncSnapshot<T>) _builder;
  final Widget Function(BuildContext, AsyncSnapshot<T>) _activeBuilder;
  final Widget Function(BuildContext, AsyncSnapshot<T>) _errorBuilder;
  final Widget Function(BuildContext, AsyncSnapshot<T>) _waitingBuilder;
  final bool _debugMode;

  CustomStreamBuilder({
    @required Stream<T> stream,
    @required Widget Function(BuildContext, AsyncSnapshot<T>) activeBuilder,
    @required Widget Function(BuildContext, AsyncSnapshot<T>) errorBuilder,
    @required Widget Function(BuildContext, AsyncSnapshot<T>) waitingBuilder,
    Widget Function(BuildContext, AsyncSnapshot<T>) builder,
    bool debugMode: false,
  })  : assert(activeBuilder != null &&
            errorBuilder != null &&
            waitingBuilder != null),
        _activeBuilder = activeBuilder,
        _errorBuilder = errorBuilder,
        _waitingBuilder = waitingBuilder,
        _stream = stream,
        _builder = builder,
        _debugMode = debugMode;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: _stream,
      builder: _builder ??
          (context, snapshot) {
            if (_debugMode) {
              print(snapshot.data);
            }

            if (snapshot.hasError) {
              return _errorBuilder(context, snapshot);
            }

            if (snapshot.connectionState == ConnectionState.active) {
              return _activeBuilder(context, snapshot);
            }

            return _waitingBuilder(context, snapshot);
          },
    );
  }
}
