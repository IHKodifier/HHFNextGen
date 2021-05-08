import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/widgets/screen_header/screen_header_desktop.dart';
import 'package:hhf_next_gen/ui/widgets/screen_header/screen_header_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScreenHeader extends StatelessWidget {
  const ScreenHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      // mobile: NavigationBarMobile(),
      mobile: Container(),
      tablet: ScreenHeaderTablet(),
      desktop: ScreenHeaderDesktop(),
    );
  }
}
