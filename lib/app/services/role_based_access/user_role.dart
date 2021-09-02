import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permission.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource.dart';

class UserRole extends Equatable {
  const UserRole({required this.roleName, required this.roleId});

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
      UserRole(roleId: 'Dispatcher', roleName: 'Case Dispatcher');

  static const guest = UserRole(roleId: 'Preview', roleName: 'Customer Preview');

  @override
  String toString() {
    return ''' roleId=$roleId  roleName=$roleName    
    ''';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [roleId];
}
