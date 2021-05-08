import 'package:flutter/material.dart';
// import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
// import 'package:the_basics/widgets/course_details/course_details.dart';

class HomeContentTablet extends StatelessWidget {
  const HomeContentTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
            color: Colors.deepPurple,
            child: Text('Tablet  Home')),
      ],
    );
  }
}
