import 'package:flutter/cupertino.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CupertinoActivityIndicator(),
    );
  }
}
