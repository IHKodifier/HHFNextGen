import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permissions.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource_identifier.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/class_info.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import 'package:hhf_next_gen/app/models/enums.dart';
import 'package:hhf_next_gen/app/providers/providers.dart' as providers;

class AccessSecuredWidget extends StatelessWidget {
  AccessSecuredWidget({
    Key? key,
    required this.child,
    this.verbose = false,
    this.accessResource,
  }) : super(key: key);
  final Widget child;
  late final auth, user, userRole;
  late final providerRef;
  final bool verbose;
  final accessResource;
  late final ClassInfo classInfo =
      ClassInfo(name: 'AccessSecuredWidget', version: '1.0.0');

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        this.providerRef = ref;

        this.auth = ref.read(providers.authProvider);
        this.user = auth.authenticatedUser;
        this.userRole = user.selectedRole;
        // final accessProvider = ref.read(providers.accessRulesRepoProvider);
        Utilities.log(userRole.roleName);

        resolveAccess(role: userRole, resource: this.accessResource);
        return Container(
          color: Colors.yellow,
        );
      },
    );
  }

  AccessPermissions resolveAccess({UserRole? role, AccessResource? resource}) {
    return AccessPermissions.none;
  }
}
