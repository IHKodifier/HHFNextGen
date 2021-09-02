/// this file defines all the providrs availsble across the app
///

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/providers/authentication_notifier.dart';
import 'package:hhf_next_gen/app/providers/authorization_notifier.dart';
import 'package:hhf_next_gen/app/services/authorization_service.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/states/authentication_state.dart';
import 'package:hhf_next_gen/app/states/authorization_state.dart';
import '../providers/providers.dart' as providers;

final authenticationProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
        (ref) => AuthenticationNotifier());

final authorizationProvider =
    StateNotifierProvider<AuthorizationNotifier, AuthorizationState>((ref) {
  final authenticationProvider =
      ref.watch(providers.authenticationProvider.notifier);

  AuthorizationNotifier authorizationNotifier =
      AuthorizationNotifier();

  authorizationNotifier.state.selectedRole =
      authenticationProvider.state.selectedRole;

  // authorizationNotifier.state.defaultUserRole =
  // authenticationProvider.state.defaultRole;

  return authorizationNotifier;
});
 
// final accessRulesRepoProvider = Provider((ref) => accessRulesRepo);

// final accessProvider= 









//TODO:
//caseStateProvider
//caseCounterProvider
//patientCouterProvider

