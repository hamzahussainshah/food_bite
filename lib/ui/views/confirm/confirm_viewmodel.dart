import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ConfirmViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  void navigateToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
