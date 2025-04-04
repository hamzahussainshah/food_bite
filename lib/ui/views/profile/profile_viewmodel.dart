import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = NavigationService();

  void navigateToAccountInfo() {
    _navigationService.navigateToAccountInformationView();
  }

  void navigateToInviteFriends() {}

  void navigateToDeliveryLocations() {
    _navigationService.navigateToDeliveryLocationsView();
  }

  void navigateToPaymentMethods() {
    _navigationService.navigateToPaymentMethodsView();
  }

  void navigateToChangePassword() {
    _navigationService.navigateToChangePasswordView();
  }
}
