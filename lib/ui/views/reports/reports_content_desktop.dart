import 'package:flutter/material.dart';

class ReportsContentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.purple[400],
        child: Center(
            child: Text(
          'ReportsContentDsktop',
          style: Theme.of(context).textTheme.headline4,
        )),
      ),
    );
  }
}
