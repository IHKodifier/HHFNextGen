import 'package:equatable/equatable.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permission.dart';
// import 'package:hhf_next_gen/app/models/enums.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';

class AccessRequest extends Equatable {
  final UserRole userRole;
  final AccessResource accessResource;

  AccessRequest({
    required this.accessResource,
    required this.userRole,
  });

  @override
  String toString() {
    return '''
    Access Request Equals 
    ${accessResource.toString()}
    ${userRole.toString()}
    ''';
  }

  @override
  List<Object?> get props => [accessResource, userRole];
}
