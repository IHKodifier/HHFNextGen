import 'package:get_it/get_it.dart';
import 'package:hhf_next_gen/app/services/firestore_service.dart';
import 'package:hhf_next_gen/app/services/navigation_service.dart';
import 'package:hhf_next_gen/app/services/search_service.dart';

GetIt servicelocator = GetIt.instance;

void registerAllServices() {
//TODO: register all services here
  servicelocator.registerLazySingleton(() => NavigationService());
  servicelocator.registerLazySingleton(() => SearchService());
  servicelocator.registerLazySingleton(() => FirestoreService());
  // TODO
  // auth service
  // notification service
}
