// import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hhf_next_gen/app/models/role_based_user.dart';
import 'package:hhf_next_gen/app/services/firestore_service.dart';
import 'package:hhf_next_gen/app/tools/class_info.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/models/enums.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
// import 'package:zimster_messaging/app/constants.dart' as constants;
// import 'package:firebase_auth/';

// /// default [photoURL] if none provided
// String _photoURLifBlank = 'https://st4.depositphotos.com/15973376/24173/v/950/depositphotos_241732228-stock-illustration-user-account-circular-line-icon.jpg';

class AppUser extends RoleBasedUser {
  AppUser({
    required this.userId,
    this.additionalAppUserInfo,
  });
  AdditionalAppUserInfo? additionalAppUserInfo;
  String? userId;
  String? get displayName => additionalAppUserInfo!.disPlayName;
  String? get email => additionalAppUserInfo!.email;
  String? get photoURL => additionalAppUserInfo!.photoUrl;
  String? get providerId => additionalAppUserInfo!.providerId;
  late var selectedRole;
  // List<UserRole> get userRoles => userRoles;

  AppUser.fromJson(Map<String, dynamic> data) {
    this.userId = data['userId'];
    // this.additionalAppUserInfo!.email=data['userId'];
    this.additionalAppUserInfo = AdditionalAppUserInfo(
      disPlayName: data['displayName'],
      email: data['email'],
      photoUrl: data['photoURL'],
      providerId: data['providerId'],
    );

//handle user Roles

    // _handleUserRoles(data);
  }
  handleUserRoles(Map<String, dynamic> data) async {
    var userRole;
    String rolesString = data['roles'];
    List<String> rolesList = rolesString.split(',');
    for (var i = 0; i < rolesList.length; i++) {
      try {
         userRole =
            await FirestoreService().getUserRoleDoc(roleId: rolesList[i]);
      } catch (e) {
        Utilities.log(e.toString());
      }

      if (i == 0) {
        this.selectedRole = userRole;
      }
      this.userRoles.add(userRole);
    }
  }

  AppUser.fromFirestoreDoc(String userId) {
    var data = FirestoreService().getAppUserDoc(userId:userId);
    // AppUser appUser= AppUser.fromJson(data);

//get

//     this.userId = data['userId'];
//     this.additionalAppUserInfo = AdditionalAppUserInfo(
//         disPlayName: data['displayName'],
//         email: data['email'],
//         photoUrl: data['photoURL'],
//         providerId: data['providerId']);

// //handle user Roles
//     String rolesString = data['roles'];
//     List<String> rolesList;
//     rolesList = rolesString.split(',');
//     rolesList.forEach((element) {
//       ///get role from firestore [userRoles] collection
//       Future<UserRole> userRole = FirestoreService()
//           .getUserRoleDoc(roleId: element) as Future<UserRole>;

//       this.userRoles.add(userRole as UserRole);
//     });
  }

  Map<String, dynamic> toJson() {
    String roles = '';
    userRoles.forEach((element) {
      roles = roles + ',' + element.roleId;
    });

    return {
      'displayName': displayName,
      'userId': userId,
      'email': email,
      'userRoles': roles,
      'providerId': providerId,
      'photoURL': photoURL,
    };
  }

  @override
  String toString() {
    String roles = '';
    userRoles.forEach((element) {
      roles = roles + ',' + element.roleId;
    });

    String str;
    str = '''
    userId: ${this.userId},
    AdditionalAppUserInfo
    displayName: ${this.displayName},
    email: ${this.email},
    photoURL: ${this.photoURL},
    providerId:${this.providerId},
    userRoles: $roles,

''';

    return str;
  }
}

class AdditionalAppUserInfo {
  String? disPlayName;

  String? email;

  String? photoUrl;

  var providerId;

  AdditionalAppUserInfo({
    this.disPlayName,
    this.email,
    this.photoUrl,
    this.providerId = 'Email',
  }) {
    assert(email != null);
  }
}

/// Parked for Future

// AppUserModel copyWith({
//   String uid,
//   String email,
//   String displayName,
//   // final String lastName;
//   // final String userRoles;
//   String photoURL,
//   String providerId,
//  ) =>
//       AppUserModel(
//         fireAuthUid:  uid ?? this.fireAuthUid,
//         displayName: displayName ?? this.displayName,
//         email: email ?? this.email,
//         photoURL: photoURL ?? this.photoURL,
//       );
