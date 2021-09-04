import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/providers/authorization_notifier.dart';
import 'package:hhf_next_gen/app/services/firestore_service.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import '../../app/providers/providers.dart' as providers;

class AppUserAvatar extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppUserAvatarState();
}

class _AppUserAvatarState extends ConsumerState<AppUserAvatar> {
  late AppUser authenticatedUser;
  late UserRole selectedRole;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    authenticatedUser =
        ref.watch(providers.authenticationProvider).authenticatedUser!;
    selectedRole = ref.watch(providers.authorizationProvider).selectedRole;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          Icons.account_circle,
          size: 50,
        ),
        Text(authenticatedUser!.email!),
        DropdownButton<String>(
          //  focusColor: Colors.amber[100],
          dropdownColor: Colors.blueGrey[50],
          isDense: true,
          autofocus: true,
          value: selectedRole.roleName,

          items: authenticatedUser.userRoles
              .map(
                (e) => DropdownMenuItem<String>(
                    child: Text(e.roleName), value: e.roleName),
              )
              .toList(),
          onChanged: (val) {
            authenticatedUser.userRoles.forEach((role) {
              if (role.roleName == val) {
                ref
                    .read(providers.authorizationProvider.notifier)
                    .setSelectedRole(role);
                Utilities.log(
                    '''selectedRole has been switched to 
                    ${ref.read(providers.authorizationProvider).selectedRole.roleName}
                      ''');
                setState(() {});
              }
            });
          },
        ),
      ],
    );
  }
}
