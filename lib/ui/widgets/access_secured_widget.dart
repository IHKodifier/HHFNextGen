import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/providers/authentication_notifier.dart';
import 'package:hhf_next_gen/app/providers/authorization_notifier.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permission.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_request.dart';
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
  late AuthenticationNotifier authenticationProvider;
  late AuthorizationNotifier authorizationProvider;
  final bool verbose;
  final accessResource;
  final ClassInfo classInfo = ClassInfo(
    name: 'AccessSecuredWidget',
    version: '1.0.0',
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        this.authenticationProvider =
            ref.read(providers.authenticationProvider.notifier);
        this.authorizationProvider =
            ref.watch(providers.authorizationProvider.notifier);
        authorizationProvider.state.selectedRole =
            authenticationProvider.state.selectedRole;
        authorizationProvider.state.authenticatedUser =
            authenticationProvider.state.authenticatedUser!;

        authorizationProvider.setPermissions(
            searchKey: AccessRequest(
                accessResource: accessResource,
                userRole: authenticationProvider.state.selectedRole));
        Utilities.log('''
        for ${accessResource.resourceId.toString()}.....
Can Careate ? ${authorizationProvider.state.canCreate}
Can Read ? ${authorizationProvider.state.canRead}
Can Edit ? ${authorizationProvider.state.canEdit}
Can Print ? ${authorizationProvider.state.canPrint}
        ''');

        if (authorizationProvider.state.canRead) {
          return this.child;
        } else
          return Center(child: Text('Access DENIED'));
      },
    );
  }
}
