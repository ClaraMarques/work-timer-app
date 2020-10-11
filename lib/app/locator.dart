import 'package:get_it/get_it.dart';

import 'blocs/auth_bloc.dart';
import 'blocs/workday_bloc.dart';
import 'data/services/auth/auth_interface.dart';
import 'data/services/auth/auth_service.dart';
import 'data/services/database/database_interface.dart';
import 'data/services/database/firestore_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<DatabaseInterface>(() => FirestoreService());

  // Registration of services.
  locator.registerLazySingleton<AuthInterface>(
    () => AuthService(locator.get<DatabaseInterface>()),
  );

  // Registration of BLOCs
  locator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(locator.get<AuthInterface>()),
  );

  // Não é um lazy pois assim que se inicia o aplicativo queremos que o dia de hoje seja adicionado a lista
  locator.registerLazySingleton<WorkdayBloc>(() => WorkdayBloc());
}
