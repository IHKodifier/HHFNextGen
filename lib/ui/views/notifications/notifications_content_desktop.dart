import 'package:flutter/material.dart';

class NotificationsContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.purple[200],
        child: Center(
            child: Text(
          'NotificationsContentDsktop',
          style: Theme.of(context).textTheme.headline4,
        )),
      ),
    );
  }
}
