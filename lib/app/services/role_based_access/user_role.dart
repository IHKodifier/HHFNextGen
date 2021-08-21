import 'package:hhf_next_gen/app/services/role_based_access/access_permissions.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource_identifier.dart';

class UserRole {
  const UserRole({
    required this.roleName,
    required this.roleId,
    // this.createdOn,
  });

  // late AppUserModel createdBy;
  final String roleName, roleId;
  // late var createdOn;

//TODO: create all roles here as static constants
  static const caseRegistrar =
      UserRole(roleId: 'Registrar', roleName: 'Case Registrar');
  static const caseEvaluator =
      UserRole(roleId: 'Evaluator', roleName: 'Case Evaluator');
  static const caseAuthorizer =
      UserRole(roleId: 'Authorizer', roleName: 'Case Authorizer');
  static const caseDispatcher =
      UserRole(roleId: 'Registrar', roleName: 'Case Registrar');
  static const guest = UserRole(roleName: 'Customer Preview', roleId: 'Guest');



  bool hasAccessToResource(
      AccessResource accessResource, AccessPermissions accessLevel) {
    //for testing
    return true;
  }
}
