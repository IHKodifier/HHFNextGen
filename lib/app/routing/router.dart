import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/routing/routenames.dart';
import 'package:hhf_next_gen/ui/views/home/home_content_desktop.dart';
import 'package:hhf_next_gen/ui/views/new_case/new_case.dart';
import 'package:hhf_next_gen/ui/views/personalization/personalization_content_desktop.dart';
import 'package:hhf_next_gen/ui/views/reports/reports_content_desktop.dart';
import 'package:hhf_next_gen/ui/views/stakeHolders/stakeholder_content_desktop.dart';
import '../../ui/views/notifications/notifications_content_desktop.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting) {
  switch (routeSetting.name) {
    case HomeRoute:
      return getPageRoute(HomeContentDesktop());
    case StakeHoldersRoute:
      return getPageRoute(StakeHolderContentDesktop());
    case NotificationsRoute:
      return getPageRoute(NotificationsContentDesktop());
    case ReportsRoute:
      return getPageRoute(ReportsContentDesktop());
    case PersonalizationRoute:
      return getPageRoute(PersonalizationContentDesktop());
    case NewCaseRoute:
      return getPageRoute(NewFinancingCase());
    default:
      return getPageRoute(HomeContentDesktop());
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
