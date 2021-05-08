import 'package:get_it/get_it.dart';
import 'package:hhf_next_gen/services/navigation_service.dart';

GetIt servicelocator = GetIt.instance;

void registerAllServices() {
//TODO: register all services here
  servicelocator.registerLazySingleton(() => NavigationService());
}
