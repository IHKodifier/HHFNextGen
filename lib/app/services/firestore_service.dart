/// # region imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
import 'package:hhf_next_gen/app/models/app_user_model.dart';
import 'package:hhf_next_gen/app/models/patient.dart';

/// endregion

/// # region ClassInfo
final String className = 'FirestoreService';
final String _version = '1.0.0';
final String _packageName = 'zimster_messaging';

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

  Future<bool?> createAppUserDoc(
      {required AppUserModel appUser, bool merge = true}) async {
    try {
      await _usercollectionReference.doc(appUser.email).set(appUser.toJson());
      ConUtils.printLog(
          'created Appuser in Firestore\n${appUser.toJson().toString()}');
    } catch (e) {
      ConUtils.printLog(
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
      ConUtils.printLog(
          'new patient with id P-0${patientCounter + 1} written to firestore with uid = $value');
      await _incrementPatientCounter().then((value) {
        ConUtils.printLog(
            'patient counter in firestore incremented to ${patientCounter + 1} ');
      });
    });
    return true;
  }
}
