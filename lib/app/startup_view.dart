import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/providers/providers.dart';
import 'package:hhf_next_gen/ui/views/home/home_view.dart';
import 'package:hhf_next_gen/ui/views/login/loginView.dart';
import '../app/routing/routenames.dart' as routes;

class StartupView extends ConsumerWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

// auth.resolveStartupLogin();

    if (auth.hasAuthenticatedUser) {
      print('authenticated User detected');
      // Navigator.of(context).pushNamed(routes.HomeRoute);
      return Material(child: HomeView());
    } else {
      print('NO \nauthenticated \nUser \ndetected');
      return Material(child: LoginView());
    }
  }

  resolveStartupLogin() {
    Utilities.log('resolving Startup Login');
    // auth
  }
}
