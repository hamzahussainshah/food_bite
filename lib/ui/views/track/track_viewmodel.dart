import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToDetails() {
    _navigationService.navigateToOrderDetailsView();
  }

  // Call the delivery person
  Future<void> callDeliveryPerson() async {
    const phoneNumber = 'tel:03130000112';
    final Uri uri = Uri.parse(phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('Could not launch $phoneNumber');
    }
  }

  // Chat with the delivery person
  void chatWithDeliveryPerson() {
    // Implement chat functionality
    print('Opening chat with delivery person...');
    // Example: Navigate to a chat screen or open a messaging app
  }
}
