import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hhf_next_gen/app/models/app_user.dart';
import 'package:hhf_next_gen/app/providers/authorization_notifier.dart';
import 'package:hhf_next_gen/app/services/firestore_service.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';
import 'package:hhf_next_gen/app/tools/utilities.dart';
import '../../app/providers/providers.dart' as providers;

class AppUserAvatar extends ConsumerWidget {
  const AppUserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(providers.authenticationProvider).authenticatedUser!;
    final state = ref.watch(providers.authorizationProvider);

    return Consumer(
      builder: (context, ref, child) {
        ref.watch(providers.authorizationProvider);
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(
              Icons.account_circle,
              size: 50,
            ),
            Text(user.email!),
            DropdownButton<String>(
              dropdownColor: Theme.of(context).primaryColorLight,
              isDense: true,
              autofocus: true,
              value: state.selectedRole.roleName,
              items: user.userRoles
                  .map(
                    (e) => DropdownMenuItem<String>(
                        child: Text(e.roleName), value: e.roleName),
                  )
                  .toList(),
              onChanged: (val) {
                user.userRoles.forEach((role) {
                  if (role.roleName == val) {
                    state.selectedRole = role;

                    Utilities.log('''selectedRole has been switched to 
                     ${state.selectedRole.roleName}
                        ''');
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }
}












// class AppUserAvatar extends ConsumerStatefulWidget {
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AppUserAvatarState();
// }

// class _AppUserAvatarState extends ConsumerState<AppUserAvatar> {
//   late AppUser authenticatedUser;
//   late UserRole selectedRoleprovider;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     authenticatedUser =
//         ref.watch(providers.authenticationProvider).authenticatedUser!;
//     selectedRoleprovider =
//         ref.watch(providers.authorizationProvider).selectedRole;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Icon(
//           Icons.account_circle,
//           size: 50,
//         ),
//         Text(authenticatedUser!.email!),
//         DropdownButton<String>(
//           //  focusColor: Colors.amber[100],
//           dropdownColor: Theme.of(context).primaryColorLight,
//           isDense: true,
//           autofocus: true,
//           value: selectedRoleprovider.roleName,

//           items: authenticatedUser.userRoles
//               .map(
//                 (e) => DropdownMenuItem<String>(
//                     child: Text(e.roleName), value: e.roleName),
//               )
//               .toList(),
//           onChanged: (val) {
//             authenticatedUser.userRoles.forEach((role) {
//               if (role.roleName == val) {
//                 ref
//                     .watch(providers.authorizationProvider.notifier).setSelectedRole(role);
//                     // .state
//                     // .selectedRole = role;
//                 // .setSelectedRole(role);
//                 Utilities.log('''selectedRole has been switched to 
//                     ${ref.read(providers.authorizationProvider).selectedRole.roleName});
//                     }
//                       ''');
//                 // setState(() {});
//               }
//             });
//           },
//         ),
//       ],
//     );
//   }
// }
