import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/routing/router.dart';
import 'package:hhf_next_gen/services/navigation_service.dart';
import 'package:hhf_next_gen/app/routing/routenames.dart' as routes;

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
    return Navigator(
      key: servicelocator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: routes.HomeRoute,

      // child: Container(
      //   height: 100,
      //   padding: EdgeInsets.only(bottom: 12),
      //   // color: Colors.greenAccent,
      //   alignment: Alignment.center,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.home,
      //                 size: 35,
      //                 color: Colors.black,
      //               ),
      //               onPressed: null),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 24),
      //             child: Text('Home'),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.people,
      //                 size: 35,
      //                 color: Colors.black,
      //               ),
      //               onPressed: () {
      //                 ConUtils.printLog('Stakholders has been clicked');
      //               }),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 24),
      //             child: Text('Stake holders'),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.notifications,
      //                 size: 35,
      //                 color: Colors.black,
      //               ),
      //               onPressed: () {
      //                 ConUtils.printLog('notifications has been clicked');
      //               }),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 24),
      //             child: Text('Notifications'),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.pie_chart,
      //                 size: 35,
      //                 color: Colors.black,
      //               ),
      //               onPressed: null),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 24),
      //             child: Text('reports'),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.settings,
      //                 size: 35,
      //                 color: Colors.black,
      //               ),
      //               onPressed: null),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 24),
      //             child: Text('Settings'),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           IconButton(
      //               icon: Icon(
      //                 Icons.umbrella_sharp,
      //                 size: 45,
      //                 color: Colors.black,
      //               ),
      //               onPressed: null),
      //           SizedBox(
      //             height: 10,
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left: 24),
      //             child: Text('Personalize'),
      //           ),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
