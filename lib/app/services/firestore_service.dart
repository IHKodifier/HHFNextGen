/// # region imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/class_info.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/models/patient.dart';

/// endregion

/// # region ClassInfo
ClassInfo _classInfo = ClassInfo(name: 'FirestoreService', version: '1.0.0');

/// endregion

/// this class wraps all the functionality required by an App to write/retrive update documents to firestore database
/// Singleton instance of this class is available across the  App  and get can be refernced by
/// instantiating an [[AuthenticationService]] via call to serviceLocator. syntax below
/// /// final AuthenticationService _authService =serviceLocator<AuthenticationService>();
///
///

class FirestoreService {
  // final DialogService dialogService = serviceLocator<DialogService>();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late int patientCounter, caseCounter;

  CollectionReference _usercollectionReference =
      FirebaseFirestore.instance.collection('appUsers');
  late DocumentReference documentReference;
  late QueryDocumentSnapshot<Map<String, dynamic>> queryDocumentSnapshot;
  late QuerySnapshot<Map<String, dynamic>> querySnapshot;

  Future<AppUser?> createAppUserDoc(
      {required AppUser appUser, bool merge = true}) async {
    try {
      queryDocumentSnapshot = (await _usercollectionReference
          .where('userId', isEqualTo: appUser.email)
          .get()) as QueryDocumentSnapshot<Map<String, dynamic>>;
      if (queryDocumentSnapshot.exists) {
        //create ApppUser to return
        AppUser appUser = AppUser.fromJson(
            (queryDocumentSnapshot.data) as Map<String, dynamic>);
        Utilities.log(appUser.toString());

        return appUser;
      } else {
        //user does not exist
        return null;
      }
      Utilities.log(
          'created Appuser in Firestore\n${appUser.toJson().toString()}');
    } catch (e) {
      Utilities.log(
          'Firestore service\n createUserProfile\nerror encountered: \n${e.toString()}');
      // dialogService.showDialog(
      //   title: 'Error',
      //   description: e.message,
      // );
    }
  }

  // Future<bool?> createAppUserDocforPhoneSignup({
  //   AppUserModel appUser,
  //   bool merge = true,
  //   String phoneNumber,
  // }) async {
  //   try {
  //     await _usercollectionReference.doc(phoneNumber).set(appUser.toJson());
  //     ConUtils.printLog(
  //         'created Appuser in Firestore\n${appUser.toJson().toString()}');
  //   } catch (e) {
  //     ConUtils.printLog(
  //         'Firestore service\n createUserProfile\nerror encountered: \n${e.toString()}');
  //     dialogService.showDialog(
  //       title: 'Error',
  //       description: e.message,
  //     );
  //   }
  // }

  // static Stream<List<AppUserModel>> getUsers() => FirebaseFirestore.instance
  //     .collection('/appUsers')
  //     .orderBy(AppUserField.lastMessageTime, descending: true)
  //     .snapshots()
  //     .transform(ConUtils.transformer(AppUserModel.fromJson));

  Future _readPatientCounter() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('patients')
        .doc('--Counter--')
        .get();
    patientCounter = querySnapshot.data()!['counter'];
    caseCounter = 99;
    return patientCounter;
  }

  Future _incrementPatientCounter() async {
    await FirebaseFirestore.instance
        .collection('patients')
        .doc('--Counter--')
        .set({'counter': patientCounter + 1}, SetOptions(merge: true));
  }

  ///create a new [patient] in the firestore's 'patients' collection with id that is read from counter doc on the collection and incremented with each successfull save
  Future createNewPatient(Patient patient) async {
    patientCounter = await _readPatientCounter();
    patient.patientId = 'P-0${patientCounter + 1}';

    FirebaseFirestore.instance
        .collection('patients')
        .add(patient.toJson())
        .then((value) async {
      Utilities.log(
          'new patient with id P-0${patientCounter + 1} written to firestore with uid = $value');
      await _incrementPatientCounter().then((value) {
        Utilities.log(
            'patient counter in firestore incremented to ${patientCounter + 1} ');
      });
    });
    return true;
  }

  ///retrive UserRole doc from  firestore [userRoles] collection

  Future<UserRole> getUserRoleDoc({required String roleId}) async {
    querySnapshot = await FirebaseFirestore.instance
        .collection('userRoles')
        .where('roleId', isEqualTo: roleId)
        .get();
    if (querySnapshot.docs.length > 0) {
      //create role Object and return
      Map<String, dynamic> data = querySnapshot.docs[0].data();
      var userRole =
          UserRole(roleId: data['roleId'], roleName: data['roleName']);
      return userRole;
    } else {
      Utilities.log('roleId: $roleId not found in firesore');
      return null as UserRole;
    }
  }

  Future<Map<String, dynamic>?> getAppUserDoc({required String userId}) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('appUsers')
        .where('userId', isEqualTo: userId)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
//get all user roles

      return querySnapshot.docs[0].data();
    } else
      throw Exception('AppUserDoc not found in Firestore');
  }

  Future<List<UserRole>?> get getAllUserRoles async {
    querySnapshot =
        await FirebaseFirestore.instance.collection('userRoles').get();

    if (querySnapshot.docs.length > 0) {
      Utilities.log('''length of userRoles collection=
 ${querySnapshot.docs.length}
 
 ''');
      //iterate through docs and
      //create role Object and return

      return querySnapshot.docs
          .map((e) => UserRole(
                roleId: e.data()["roleId"],
                roleName: e.data()['roleName'],
              ))
          .toList();
    } else {
      return null;
    }
  }

  // _handleUserRoles() {

  // var userRole;
  //   String rolesString = data['roles'];
  //   List<String> rolesList = rolesString.split(',');
  //   for (var i = 0; i < rolesList.length; i++) {
  //     try {
  //        userRole =
  //           await FirestoreService().getUserRoleDoc(roleId: rolesList[i]);
  //     } catch (e) {
  //       Utilities.log(e.toString());
  //     }

  //     if (i == 0) {
  //       this.selectedRole = userRole;
  //     }
  //     this.userRoles.add(userRole);
  //   }



  // }
}
