import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/services/authentication_service.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/states/authentication_state.dart';
import '../../app/routing/routenames.dart' as routes;

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  NavigationService navigationService = servicelocator<NavigationService>();
  AuthenticationNotifier() : super(AuthenticationState());

  bool busy = false;

  late AppUser _appUser;
  AppUser? get authenticatedUser => _appUser;
  late final hasAuthenticatedUser = state.hasAuthenticatedUser;
  

  signIn({required String email, required String password}) async {
    state.isBusy = true;
    try {
      _appUser = (await AuthenticationService()
          .loginWithEmail(email: email, password: password))!;
    } catch (e) {
      Utilities.log(e.toString());
    }
    state.isBusy = false;
    if (_appUser != null) {
      state.isBusy = false;
      state.hasAuthenticatedUser = true;
      state.authenticatedUser = _appUser;

      navigationService.navigatorKey.currentState!
          .popAndPushNamed(routes.HomeRoute);
    } else {
      //login has failed
      state.isBusy = false;
      state.hasAuthenticatedUser = false;
    }
  }

  signUp(String email, String password) {
    AuthenticationService().createUserWithEmail(email, password);
  }

  bool get isBusy => state.isBusy;
  List<UserRole> get roles => state.authenticatedUser!.userRoles;
}
