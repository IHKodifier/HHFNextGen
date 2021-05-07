import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/nav_bar_mobile.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/nav_bar_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // mobile: NavigationBarMobile(),
      mobile: Container(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}
