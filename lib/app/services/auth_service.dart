/// # region Legal
/// Copyright 2017 The EnigmaTek.Inc. All rights reserved.
/// Use of this source code is governed by a BSD-style license that can be
/// found in the LICENSE file.
/// //TODO:  add license file
/// endregion

// # region imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hhf_next_gen/app/services/firestore_service.dart';

import '../models/app_user.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';

// #endregion
class AuthService {
  late AppUser currentAppUser;
  final _authInstance = FirebaseAuth.instance;
  late UserCredential userCredential;
  // var authResult;

  Future<AppUser?> loginWithEmail(
      {required String email, required String password}) async {
    try {
      userCredential = await _authInstance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Utilities.log(e.toString());
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
    }

    if (userCredential.user != null) {
      Utilities.log(
          'sign in with EMAIL/PASSWORD successfull for ${userCredential.user!.email}');
      Utilities.log('reading app user doc from firestore');
      var data = await FirestoreService()
          .getAppUserDoc(userId: userCredential.user!.email!);

      //create AppUser
      Utilities.log('creating AppUser');
      currentAppUser = AppUser.fromJson(data!);
      await currentAppUser.handleUserRoles(data);
      return currentAppUser;
      // currentAppUser = AppUser(userId: userCredential.user!.email);
      //TODO: read appUserDoc from Firestore

    } else {
      currentAppUser = null as AppUser;
    }

    Utilities.log(
        'credentials verified by Auth Service for ${userCredential.user!.email}');
    Utilities.log('returning user from Auth Service');

    return currentAppUser;
  }

  createUserWithEmail(String email, String password) async {
    var result;
    try {
      final UserCredential userCredential =
          await _authInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      result = userCredential;
    } catch (e) {
      Utilities.log(e.toString());
      Utilities.log(result.toString());
    }
  }
}
