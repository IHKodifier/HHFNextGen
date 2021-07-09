/// # region Legal
/// Copyright 2017 The EnigmaTek.Inc. All rights reserved.
/// Use of this source code is governed by a BSD-style license that can be
/// found in the LICENSE file.
/// //TODO:  add license file
/// endregion
// # region imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app/models/app_user_model.dart';
import 'package:hhf_next_gen/app/console_utility.dart';

class AuthService {
  late AppUserModel currentAppUser;
  final _authInstance = FirebaseAuth.instance;
  late UserCredential userCredential;
  // var authResult;

  Future<dynamic> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      userCredential = await _authInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      ConUtils.printLog(e.toString());
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }

      // if (userCredential != null) {
      //   ConUtils.printLog('sign in with EMAIL/PASSWORD successfull for $email');

      //   // return authResult.user;
      // } else {
      //   // currentAppUser = null;
      //   return null;
    }
    ConUtils.printLog('credentials verified by Auth Service for ${userCredential.user!.email}');
    ConUtils.printLog('returning user from Auth Service');
    return userCredential.user;
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
      ConUtils.printLog(e.toString());
      ConUtils.printLog(result.toString());
    }
  }
}
