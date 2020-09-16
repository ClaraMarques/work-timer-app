import 'package:get_it/get_it.dart';
import 'package:work_timer_app/app/data/services/firestore_service.dart';

import 'blocs/auth_bloc.dart';
import 'data/services/auth/auth_interface.dart';
import 'data/services/auth/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<FirestoreService>(() => FirestoreService());

  // Registration of services.
  locator.registerLazySingleton<AuthInterface>(
    () => AuthService(locator.get<FirestoreService>()),
  );

  // Registration of BLOCs
  locator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(locator.get<AuthInterface>()),
  );
}
