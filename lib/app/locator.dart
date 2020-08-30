import 'package:get_it/get_it.dart';

import 'blocs/auth_bloc.dart';
import 'data/services/auth/auth_interface.dart';
import 'data/services/auth/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Registration of services.
  locator.registerLazySingleton<AuthInterface>(
    () => AuthService(),
  );

  // Registration of BLOCs
  locator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(locator.get<AuthInterface>()),
  );
}
