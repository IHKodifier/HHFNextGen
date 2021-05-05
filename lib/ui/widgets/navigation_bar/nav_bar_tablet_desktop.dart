import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/nav_bar_item.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/nav_bar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Episodes'),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About'),
            ],
          ),
          // NavBarLogo(),
        ],
      ),
    );
  }
}
