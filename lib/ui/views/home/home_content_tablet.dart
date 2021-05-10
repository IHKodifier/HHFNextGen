import 'package:flutter/material.dart';
// import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
// import 'package:the_basics/widgets/course_details/course_details.dart';

class HomeContentTablet extends StatelessWidget {
  const HomeContentTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            ' TAB Mode',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Welcome User'),
          Text('Today is Busy!'),
          Text('Take a look'),
        ],
      ),
    );
  }
}
