import 'package:equatable/equatable.dart';

class AccessPermission  extends Equatable{
  final permissionId, perMissionName;

  AccessPermission({this.permissionId, this.perMissionName});

  static final   Create =AccessPermission(permissionId: 'Create', perMissionName: 'Create Entity');
  static final Read = AccessPermission(permissionId: 'Read', perMissionName: 'Read Entity');
  static final Edit = AccessPermission(permissionId: 'Edit', perMissionName: 'Edit Entity');
  static final Print = AccessPermission(permissionId: 'Print', perMissionName: 'Print Entity');
  static final Click = AccessPermission(permissionId: 'Click', perMissionName: 'Click Button');
  static final none = AccessPermission(permissionId: 'None', perMissionName: 'Access Denied ');


  @override
  // TODO: implement props
  List<Object?> get props => [permissionId];
}
