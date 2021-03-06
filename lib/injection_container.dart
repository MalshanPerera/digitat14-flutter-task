import 'package:get_it/get_it.dart';

import 'repository/clients/home_repository.dart';
import 'repository/delegates/home_delegate.dart';
import 'services/error_service.dart';
import 'services/navigation_service.dart';
import 'services/network_service.dart';
import 'view_models/home_view_model/home_view_model.dart';
import 'view_models/home_view_model/i_home_view_model.dart';

final sl = GetIt.instance;

void init() {
  /// Register all the view models
  sl.registerFactory<HomeViewModel>(
    () => IHomeViewModel(
      homeRepository: sl(),
    ),
  );

  /// Register all the repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeDelegate(
      networkService: sl(),
      errorService: sl(),
    ),
  );

  /// Register all the services
  sl.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );
  sl.registerLazySingleton<ErrorService>(
    () => ErrorService(
      navigationService: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkService>(
    () => NetworkService(
      errorService: sl(),
    ),
    dispose: (c) => c.dispose(),
  );
}
