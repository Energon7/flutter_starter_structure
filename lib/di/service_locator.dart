import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/env/app_env.dart';
import '../core/network/auth_api.dart';
import '../core/network/dio_client.dart';
import '../core/network/token_refresher.dart';
import '../core/services/notification_service.dart';
import '../core/services/token_storage.dart';
import '../core/utils/permission_service.dart';
import '../core/utils/url_launcher_service.dart';
import '../routing/app_router.dart';

final GetIt getIt = GetIt.instance;

Future<void> configureDependencies() async {
  getIt.registerSingleton<AppEnv>(AppEnv.fromEnv());

  getIt.registerSingletonAsync<SharedPreferences>(
    () async => SharedPreferences.getInstance(),
  );

  getIt.registerSingletonWithDependencies<TokenStorage>(
    () => TokenStorage(getIt<SharedPreferences>()),
    dependsOn: [SharedPreferences],
  );

  getIt.registerSingleton<AuthApi>(
    AuthApi(
      dio: Dio(BaseOptions(baseUrl: getIt<AppEnv>().baseUrl)),
      env: getIt<AppEnv>(),
    ),
  );

  getIt.registerSingletonWithDependencies<TokenRefresher>(
    () => TokenRefresher(
      storage: getIt<TokenStorage>(),
      authApi: getIt<AuthApi>(),
    ),
    dependsOn: [TokenStorage],
  );

  getIt.registerSingletonWithDependencies<DioClient>(
    () => DioClient(
      env: getIt<AppEnv>(),
      storage: getIt<TokenStorage>(),
      refresher: getIt<TokenRefresher>(),
    ),
    dependsOn: [TokenStorage, TokenRefresher],
  );

  getIt.registerLazySingleton<NotificationService>(NotificationService.new);
  getIt.registerLazySingleton<PermissionService>(PermissionService.new);
  getIt.registerLazySingleton<UrlLauncherService>(UrlLauncherService.new);

  getIt.registerSingleton<AppRouter>(AppRouter());

  await getIt.allReady();
}
