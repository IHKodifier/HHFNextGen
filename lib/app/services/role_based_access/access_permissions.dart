import 'package:equatable/equatable.dart';

class AccessPermissions  extends Equatable{
  final permissionId, perMissionName;

  AccessPermissions({this.permissionId, this.perMissionName});

  static final Create =AccessPermissions(permissionId: 'create', perMissionName: 'Create Entity');
  static final Read = AccessPermissions(permissionId: 'Read', perMissionName: 'Read Entity');
  static final Edit = AccessPermissions(permissionId: 'Edit', perMissionName: 'Edit Entity');
  static final Print = AccessPermissions(permissionId: 'Print', perMissionName: 'Print Entity');
  static final none = AccessPermissions(permissionId: 'None', perMissionName: 'Access Denied ');

  @override
  // TODO: implement props
  List<Object?> get props => [permissionId];
}
