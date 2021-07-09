import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/models/app_user_model.dart';
import 'package:hhf_next_gen/app/services/auth_service.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/states/auth_state.dart';
import '../../app/routing/routenames.dart' as routes;

class AuthStateNotifier extends StateNotifier<AuthState> {
  NavigationService navigationService = servicelocator<NavigationService>();
  AuthStateNotifier() : super(AuthState());
  // late final authResult;
  bool busy = false;

  //for testing set to false

  late final hasAuthenticatedUser = state.hasAuthenticatedUser;

  signIn({required String email, required String password}) async {
    state.isBusy = true;
    // await Future.delayed(Duration(seconds: 5));
    var authResult;
    try {
      authResult =
          await AuthService().loginWithEmail(email: email, password: password);
    } catch (e) {
      ConUtils.printLog(e.toString());
      state.isBusy = false;
    }
    if (authResult != null) {
      state.isBusy = false;
      state.authenticatedUser = AppUserModel.fromMinimal(email);
      state.hasAuthenticatedUser = true;

      navigationService.navigatorKey.currentState!
          .popAndPushNamed(routes.HomeRoute);
      ConUtils.printLog(
          'returned User received by notifier = \n ${authResult.email}');
    } else {
      state.isBusy = false;
      state.hasAuthenticatedUser = false;
      state.authenticatedUser = AppUserModel.fromNull();
      ConUtils.printLog(
          'Null  User received by Auth State Notifier \n ${authResult.toString()}');
    }
  }

  signUp(String email, String password) {
    AuthService().createUserWithEmail(email, password);
  }

  bool get isBusy => state.isBusy;
}
