import 'package:flutter/cupertino.dart';

class LoadingIndicator extends StatelessWidget {
  final EdgeInsets padding;

  const LoadingIndicator({Key key, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: CupertinoActivityIndicator(),
    );
  }
}
