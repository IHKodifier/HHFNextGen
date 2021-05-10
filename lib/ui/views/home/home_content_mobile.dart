import 'package:flutter/material.dart';
// import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
// import 'package:the_basics/widgets/course_details/course_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Text(
          'MOBILE MODE',
          style: Theme.of(context).textTheme.headline5,
        )),
      ],
    );
  }
}
