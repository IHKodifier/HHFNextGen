import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/states/authentication_state.dart';

class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier(AuthenticationState state) : super(state);

  //for testing set to false

  // TODO implement business logic
  late final hasAuthenticatedUser = false;
  // signIn(){}
  // signOut()
  // refreshUser(){}

  //
}
