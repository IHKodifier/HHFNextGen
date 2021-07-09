import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/routing/router.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/constants/theme.dart';
import 'package:hhf_next_gen/app/startup_view.dart';
// import 'package:hhf_next_gen/ui/views/home/home_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HHF NeXt Gen!!!',
      debugShowCheckedModeBanner: false,
      theme: globalTheme,
      home: StartupView(),
      onGenerateRoute: generateRoute,
      // initialRoute: routes.HomeRoute,
      navigatorKey: servicelocator<NavigationService>().navigatorKey,
    );
  }
}
