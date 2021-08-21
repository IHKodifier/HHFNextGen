import 'package:equatable/equatable.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permissions.dart';
// import 'package:hhf_next_gen/app/models/enums.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource_identifier.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';

class AccessRight extends Equatable {
  final UserRole userRole;
  final List<AccessPermissions> accessLevel;
  final AppUser createdBy;
  var  createdOn = DateTime.now();

  AccessRight({
    required this.accessLevel,
    required this.userRole,
    required this.createdBy,
  });

  static initializeRoleAccessRepo(List<AccessRight> rolesRepo) {}

  @override
  List<Object?> get props => [userRole,accessLevel];
}
