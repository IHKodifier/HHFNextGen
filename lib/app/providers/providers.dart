import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/providers/authentication_state_notifier.dart';
import 'package:hhf_next_gen/app/states/authentication_state.dart';

final authenticatedUserProvider = Provider<AuthenticatedUser>(
    (ref) => AuthenticatedUser('Nasir Mehmood', 'Billing Officer'),
    name: 'authenticatedUserProvider');

final authenticationStateController =StateNotifierProvider((ref)=> AuthenticationStateNotifier(AuthenticationState()),
name: 'jkl');
   

class AuthenticatedUser {
  final String name;
  final String userId;

  AuthenticatedUser(this.name, this.userId);
}
