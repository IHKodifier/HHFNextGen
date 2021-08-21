import 'package:hhf_next_gen/app/providers/providers.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';

class AuthState {
  // TODO implement business logic
  late AppUser? authenticatedUser = null as AppUser;
  bool isBusy = false;
  late final String photoURL;
  late bool hasAuthenticatedUser = false;
  List<UserRole> get roles => authenticatedUser!.userRoles;
  UserRole get  selectedRole=>authenticatedUser!.selectedRole;

  resolveStartupLogin() {
    throw UnimplementedError();
    // hasAuthenticatedUser = false;
  }
}
