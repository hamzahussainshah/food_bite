import 'package:stacked/stacked.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/local_storage_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    _storageService.init();
    await Future.delayed(const Duration(seconds: 3));

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithOnboardingView();
  }
}
