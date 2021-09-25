import 'package:hhf_next_gen/app/providers/providers.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permission.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource.dart';
import 'package:hhf_next_gen/app/services/role_based_access/authorization_rules_repo.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/ui/widgets/access_secured_widget.dart';

class AuthorizationState {
  // TODO implement business logic

  late UserRole defaultUserRole;
  late UserRole selectedRole;
  late List<UserRole> userRoles = [];
  late AppUser authenticatedUser;
  late List<AccessPermission>? grantedPermissions;
  bool canRead = false, canCreate = false, canEdit = false, canPrint = false,canClick=false;



 

}
