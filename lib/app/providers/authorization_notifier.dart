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
  AuthorizationNotifier() : super(AuthorizationState());

  UserRole get selectedRole => state.selectedRole;
  final authorizationRulesRepo = authorizarionRulesRepository;
  bool get canRead => state.canRead;
  bool get canCreate => state.canCreate;
  bool get canEdit => state.canEdit;
  bool get canPrint => state.canPrint;

  List<AccessPermission>? getPermissions({required AccessRequest searchKey}) {
    Utilities.log(
        'checking permissions for ${searchKey.userRole.roleId} to access ${searchKey.accessResource.resourceId}');
    // Utilities.log(
    //     'Printing authorization rules repository ${authorizationRulesRepo}');
    if (authorizationRulesRepo.containsKey(searchKey)) {
      state.grantedPermissions = authorizationRulesRepo[searchKey];
    } else
      state.grantedPermissions = [AccessPermission.none];
    // Utilities.log('permissions found...${state.grantedPermissions}');

    // Utilities.log('NO \npermissions found...${state.grantedPermissions}');
    _initiaizePermissionGetters();
    return state.grantedPermissions;
  }

  void _initiaizePermissionGetters() {
    state.grantedPermissions!.forEach((element) {
      if (element == AccessPermission.Create) state.canCreate = true;
      if (element == AccessPermission.Edit) state.canEdit = true;
      if (element == AccessPermission.Read) state.canRead = true;
      if (element == AccessPermission.Print) state.canPrint = true;
    });
  }

  // bool canCreate(AccessSecuredWidget widget) => state.canCreate(widget);
}
