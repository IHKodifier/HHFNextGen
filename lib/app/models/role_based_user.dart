import 'package:hhf_next_gen/app/services/firestore_service.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';

class RoleBasedUser {
  late List<UserRole> _userRoles = [];

  List<UserRole> get userRoles => _userRoles;
  // Future<List<UserRole>?> getFirestoreRoles() async {
  //   var data = FirestoreService().getAllUserRoles;
  //   return data;
  // }
}
