import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/views/home/home_content_desktop.dart';
import 'package:hhf_next_gen/ui/views/home/home_content_mobile.dart';
import 'package:hhf_next_gen/ui/widgets/centered_view/centered_view.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_bar/navigation_bar.dart';
import 'package:hhf_next_gen/ui/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        appBar: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? AppBar(
                backgroundColor: Colors.red[800],
              )
            : null,
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // NavigationBar(),
            Expanded(
                child: ScreenTypeLayout(
              mobile: HomeContentMobile(),
              desktop: HomeContentDesktop(),
            ))
          ],
        ),
      ),
    );
  }
}
