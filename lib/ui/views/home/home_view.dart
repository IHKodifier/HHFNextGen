import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/services/navigation_service.dart';
import 'package:hhf_next_gen/ui/views/home/home_content_desktop.dart';
import 'package:hhf_next_gen/ui/views/home/home_content_mobile.dart';
import 'package:hhf_next_gen/ui/views/home/home_content_tablet.dart';
import 'package:hhf_next_gen/ui/widgets/centered_view/centered_view.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:hhf_next_gen/ui/widgets/screen_header/screen_header.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        appBar: (sizingInformation.deviceScreenType == DeviceScreenType.mobile)
            ? AppBar(
                backgroundColor: Colors.red[800],
              )
            : null,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
                sizingInformation.deviceScreenType == DeviceScreenType.tablet
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white54,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (sizingInformation.deviceScreenType != DeviceScreenType.mobile)
                ? ScreenHeader()
                : Container(),
            Expanded(
                child: ScreenTypeLayout(
              mobile: HomeContentMobile(),
              desktop: HomeContentDesktop(),
              tablet: HomeContentTablet(),
            ))
          ],
        ),
      ),
    );
  }
}
