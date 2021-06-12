import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/routing/router.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/constants/theme.dart';
import 'package:hhf_next_gen/ui/views/home/home_view.dart';
import 'routing/routenames.dart' as routes;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HHF NeXt Gen!!!',
      debugShowCheckedModeBanner: false,
      theme: globalTheme,
      home: HomeView(),
      onGenerateRoute: generateRoute,
      // initialRoute: routes.HomeRoute,
      navigatorKey: servicelocator<NavigationService>().navigatorKey,
    );
  }
}
