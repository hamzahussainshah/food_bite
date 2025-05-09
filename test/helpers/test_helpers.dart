import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_bite/services/app_states_service.dart';
import 'package:food_bite/services/local_storage_service.dart';
import 'package:food_bite/services/file_picker_service.dart';
import 'package:food_bite/services/local_storage_service.dart';
import 'package:food_bite/services/api_service.dart';
import 'package:food_bite/services/auth_service.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:food_bite/services/order_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AppStatesService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<FilePickerService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<LocalStorageService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DatabaseService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DatabaseService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<OrderService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterAppStatesService();
  getAndRegisterLocalStorageService();
  getAndRegisterFilePickerService();
  getAndRegisterLocalStorageService();
  getAndRegisterApiService();
  getAndRegisterAuthService();
  getAndRegisterDatabaseService();
  getAndRegisterDatabaseService();
  getAndRegisterOrderService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockAppStatesService getAndRegisterAppStatesService() {
  _removeRegistrationIfExists<AppStatesService>();
  final service = MockAppStatesService();
  locator.registerSingleton<AppStatesService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

MockFilePickerService getAndRegisterFilePickerService() {
  _removeRegistrationIfExists<FilePickerService>();
  final service = MockFilePickerService();
  locator.registerSingleton<FilePickerService>(service);
  return service;
}

MockLocalStorageService getAndRegisterLocalStorageService() {
  _removeRegistrationIfExists<LocalStorageService>();
  final service = MockLocalStorageService();
  locator.registerSingleton<LocalStorageService>(service);
  return service;
}

MockApiService getAndRegisterApiService() {
  _removeRegistrationIfExists<ApiService>();
  final service = MockApiService();
  locator.registerSingleton<ApiService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockDatabaseService getAndRegisterDatabaseService() {
  _removeRegistrationIfExists<DatabaseService>();
  final service = MockDatabaseService();
  locator.registerSingleton<DatabaseService>(service);
  return service;
}

MockDatabaseService getAndRegisterDatabaseService() {
  _removeRegistrationIfExists<DatabaseService>();
  final service = MockDatabaseService();
  locator.registerSingleton<DatabaseService>(service);
  return service;
}

MockOrderService getAndRegisterOrderService() {
  _removeRegistrationIfExists<OrderService>();
  final service = MockOrderService();
  locator.registerSingleton<OrderService>(service);
  return service;
}
// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
