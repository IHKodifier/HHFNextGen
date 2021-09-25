import 'package:hhf_next_gen/app/models/enums.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_permission.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_resource.dart';
import 'package:hhf_next_gen/app/services/role_based_access/access_request.dart';
import 'package:hhf_next_gen/app/services/role_based_access/user_role.dart';

Map<AccessRequest, List<AccessPermission>> authorizarionRulesRepository = {
  AccessRequest(
      accessResource: AccessResource(
        resourceId: 'PatientProfile',
        resourceName: 'Patient Profile',
        resourceType: ResourceType.Entity,
      ),
      userRole: UserRole.caseRegistrar): [
    AccessPermission.Create,
    AccessPermission.Edit,
    AccessPermission.Read,
    AccessPermission.Print
  ],
  AccessRequest(
      accessResource: AccessResource(
        resourceId: 'PatientProfile',
        resourceName: 'Patient Profile',
        resourceType: ResourceType.Entity,
      ),
      userRole: UserRole.caseEvaluator): [
    AccessPermission.Read,
    AccessPermission.Print
  ],
  AccessRequest(
      accessResource: AccessResource(
          resourceId: 'NewCaseButton',
          resourceName: 'New Case Button',
          resourceType: ResourceType.Button),
      userRole: UserRole.caseRegistrar): [
    AccessPermission.Click,
  ]
};
