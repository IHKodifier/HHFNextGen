import 'package:equatable/equatable.dart';
import 'package:hhf_next_gen/app/models/enums.dart';

class AccessResource extends Equatable {
  final String resourceId;
  final String resourceName;
  final ResourceType resourceType;

  AccessResource(
      {required this.resourceId,
      required this.resourceType,
      required this.resourceName});

  @override
  String toString() {
    return '''
    resourceId=${resourceId} resourceName=${resourceName} resourceType=${resourceType.toString()}    
    ''';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [resourceId, resourceType];
}
