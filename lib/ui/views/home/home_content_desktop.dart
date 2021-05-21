import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/routing/router.dart';
import 'package:hhf_next_gen/app/theme.dart';
import 'package:hhf_next_gen/services/navigation_service.dart';
import 'package:hhf_next_gen/app/routing/routenames.dart' as routes;
import 'package:hhf_next_gen/ui/views/home/home_welcome_note.dart';
import 'package:hhf_next_gen/ui/views/home/job_inbox.dart';
import 'package:hhf_next_gen/ui/views/home/project_overview.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              HomeWelcomeNote(),
              SizedBox(
                height: 20,
              ),
              ProjectOverview(),
              // JobInbox(),
              Column(
                children: [
                  Text(
                    'Your Job Inbox',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  JobInbox(),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildNavBar(BuildContext context) {
    return Navigator(
      key: servicelocator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: routes.HomeRoute,
    );
  }
}
