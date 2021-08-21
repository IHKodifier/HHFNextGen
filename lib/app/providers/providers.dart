/// this file defines all the providrs availsble across the app
///

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/locator.dart';
import 'package:hhf_next_gen/app/providers/authentication_state_notifier.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resolution.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource_identifier.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_right.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_rules_repo.dart';
import 'package:hhf_next_gen/app/states/auth_state.dart';

final authProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
    (ref) => AuthStateNotifier());

// final accessRulesRepoProvider = Provider((ref) => accessRulesRepo);

// final accessProvider= 









//TODO:
//caseStateProvider
//caseCounterProvider
//patientCouterProvider

