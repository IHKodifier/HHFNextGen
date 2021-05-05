import 'package:flutter/material.dart';
// import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
// import 'package:the_basics/widgets/course_details/course_details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          color: Colors.teal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 60,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.people,
                    size: 60,
                  ),
                  onPressed: null),
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 60,
                  ),
                  onPressed: null)
            ],
          ),
        ),
      ],
    );
  }
}
