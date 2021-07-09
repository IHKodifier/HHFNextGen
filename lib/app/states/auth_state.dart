import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/models/app_user_model.dart';

class AuthState {
  // TODO implement business logic
  late AppUserModel authenticatedUser;
  bool isBusy = false;
  late final Iterable<String> roles;
  late final String photoURL;

  ///for testing set to true
  late bool hasAuthenticatedUser = false;

  resolveStartupLogin() {
    //  throw UnimplementedError();
    hasAuthenticatedUser = false;
  }
}
