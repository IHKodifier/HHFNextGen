import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
// import 'package:the_basics/widgets/call_to_action/call_to_action.dart';
// import 'package:the_basics/widgets/course_details/course_details.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // buildNavBar(context),
      ],
    );
  }

  buildNavBar(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.only(bottom: 12),
      // color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: null),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Home'),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.people,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    ConUtils.printLog('Stakholders has been clicked');
                  }),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Stake holders'),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    ConUtils.printLog('notifications has been clicked');
                  }),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Notifications'),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.pie_chart,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: null),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('reports'),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: null),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Settings'),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.umbrella_sharp,
                    size: 45,
                    color: Colors.black,
                  ),
                  onPressed: null),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text('Personalize'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
