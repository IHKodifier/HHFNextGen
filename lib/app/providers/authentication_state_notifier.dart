import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/services/auth_service.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/states/auth_state.dart';
import '../../app/routing/routenames.dart' as routes;

class AuthStateNotifier extends StateNotifier<AuthState> {
  NavigationService navigationService = servicelocator<NavigationService>();
  AuthStateNotifier() : super(AuthState());

  bool busy = false;

  late AppUser _appUser;

  late final hasAuthenticatedUser = state.hasAuthenticatedUser;

  signIn({required String email, required String password}) async {
    state.isBusy = true;
    try {
      _appUser = (await AuthService()
          .loginWithEmail(email: email, password: password))!;
    } catch (e) {
      Utilities.log(e.toString());
    
    }
    state.isBusy = false;
    if (_appUser != null) {
      
      state.isBusy = false;
      // state.authenticatedUser = AppUser.fromMinimal(email);
      state.hasAuthenticatedUser = true;
      state.authenticatedUser = _appUser;

      navigationService.navigatorKey.currentState!
          .popAndPushNamed(routes.HomeRoute);
    } else {}
    state.isBusy = false;
    state.hasAuthenticatedUser = true;
  }

  signUp(String email, String password) {
    AuthService().createUserWithEmail(email, password);
  }

  bool get isBusy => state.isBusy;
  List<UserRole> get roles => state.authenticatedUser!.userRoles;
}
