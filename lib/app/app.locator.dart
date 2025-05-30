// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../core/config/config.dart';
import '../services/api_service.dart';
import '../services/app_states_service.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import '../services/file_picker_service.dart';
import '../services/local_storage_service.dart';
import '../services/order_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AppStatesService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => FilePickerService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => Config());
  locator.registerLazySingleton(() => OrderService( locator<DatabaseService>()));
}
