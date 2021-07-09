/// this file defines all the providrs availsble across the app
///

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/providers/authentication_state_notifier.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/states/auth_state.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier());
// final navProvider = Provider((ref)=> servicelocator<NavigationService>());

//caseStateProvider
//caseCounterProvider
//patientCouterProvider

// final authenticatedUserProvider = Provider<AuthenticatedUser>(
//     (ref) => AuthenticatedUser('Nasir Mehmood', 'Billing Officer'),
//     name: 'authenticatedUserProvider');

// final authenticationStateController =StateNotifierProvider((ref)=> AuthenticationStateNotifier(AuthenticationState()),
// name: 'jkl');

class AuthenticatedUser {
  final String name;
  final String userId;

  AuthenticatedUser(this.name, this.userId);
}
