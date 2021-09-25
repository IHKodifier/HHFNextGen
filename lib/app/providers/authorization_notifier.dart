import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/providers/providers.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permission.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_request.dart';
import 'package:hhf_next_gen/app/services/role_based_access/authorization_rules_repo.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/states/authorization_state.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/ui/widgets/access_secured_widget.dart';

class AuthorizationNotifier extends StateNotifier<AuthorizationState> {
  AuthorizationNotifier(this.authenticatedUser) : super(AuthorizationState());
  final authenticatedUser;

  final authorizationRulesRepo = authorizarionRulesRepository;



  void setPermissions({required AccessRequest searchKey}) {
    Utilities.log('''...
        checking permissions for ${searchKey.userRole.roleId} to access ${searchKey.accessResource.resourceId}...''');
    // Utilities.log(
    //     'Printing authorization rules repository ${authorizationRulesRepo}');
    if (authorizationRulesRepo.containsKey(searchKey)) {
      final grantedPermissions = authorizationRulesRepo[searchKey];
      resolveAccess(grantedPermissions);
    } else
      state.grantedPermissions = [AccessPermission.none];
   

  }

  void resolveAccess(List<AccessPermission>? grantedPermissions) {
    grantedPermissions!.forEach((permission) {
      if (permission == AccessPermission.Click) {
        state.canClick = true;
      }
         if (permission == AccessPermission.Edit) {
        state.canEdit = true;
      }
         if (permission == AccessPermission.Read) {
        state.canRead = true;
      }
      if (permission == AccessPermission.Print) {
        state.canPrint = true;
      }
    });
  }
}
