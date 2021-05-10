import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/services/navigation_service.dart';
import 'package:intl/intl.dart';
import 'package:hhf_next_gen/app/routing/routenames.dart' as routes;

class ScreenHeaderTablet extends StatelessWidget {
  ScreenHeaderTablet({Key? key}) : super(key: key);
  NavigationService navigationService = servicelocator<NavigationService>();

  String route = '';
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColor,
          height: 58,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 96),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '${DateFormat.yMMMMEEEEd().format(DateTime.now())}',
                      style: GoogleFonts.pangolin(
                        textStyle: Theme.of(context).textTheme.headline4,
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Aamra Abbasi',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.raleway(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Text(
                          'Case Registrar',
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.raleway(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 40,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 80,
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
                        size: 45,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        navigationService.navigateTo(routes.HomeRoute);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.people,
                        size: 45,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ConUtils.printLog('Stakholders has been clicked');
                        this.route = routes.StakeHoldersRoute;
                        navigationService.navigateTo(routes.StakeHoldersRoute);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.notifications,
                        size: 45,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ConUtils.printLog('notifications has been clicked');
                        navigationService.navigateTo(routes.NotificationsRoute);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.pie_chart,
                        size: 45,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ConUtils.printLog('Reports has been clicked');
                        navigationService.navigateTo(routes.ReportsRoute);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 45,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        ConUtils.printLog('settings has been clicked');
                        // navigationService.navigateTo(routes.s);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 24),
                  //   child: Text('Settings'),
                  // ),
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
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 24),
                  //   child: Text('Personalize'),
                  // ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
