import 'package:flutter_riverpod/flutter_riverpod.dart';

final authenticatedUserProvider = Provider((ref)=>AuthenticatedUser('IHK', 'IHKOdifier'));









class AuthenticatedUser {
  final String name;
  final String userId;

  AuthenticatedUser(this.name, this.userId);
}
