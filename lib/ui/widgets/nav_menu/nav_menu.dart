import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/widgets/nav_menu/nav_menu_item.dart';
import '../../../app/routing/routenames.dart' as routes;

class NavMenu extends StatelessWidget {
  // TODO role based Nav Menu to be created here

  // for dummy testing
  final navItems = [
    NavMenuItem(title: 'Home', icon: Icons.home, routeName: routes.HomeRoute),
    NavMenuItem(
        title: 'Stakeholders',
        icon: Icons.people,
        routeName: routes.StakeHoldersRoute),
    NavMenuItem(
        title: 'Notifications',
        icon: Icons.settings,
        routeName: routes.NotificationsRoute),
    NavMenuItem(title: 'Home', icon: Icons.notifications, routeName: routes.HomeRoute),
    
    NavMenuItem(
        title: 'messages', icon: Icons.chat, routeName: routes.HomeRoute),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: navItems,
      mainAxisSize: MainAxisSize.max,
      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}
