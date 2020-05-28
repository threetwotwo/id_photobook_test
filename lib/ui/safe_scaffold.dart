import 'package:flutter/material.dart';

///A scaffold widget that wraps its child around a [SafeArea]
class SafeScaffold extends StatelessWidget {
  final Widget child;
  final AppBar appBar;

  const SafeScaffold({Key key, @required this.child, this.appBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: child,
    );
  }
}
