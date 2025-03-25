import 'package:food_bite/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:food_bite/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:food_bite/ui/views/home/home_view.dart';
import 'package:food_bite/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:food_bite/ui/views/onboarding/onboarding_view.dart';
import 'package:food_bite/ui/views/login/login_view.dart';
import 'package:food_bite/ui/views/signup/signup_view.dart';
import 'package:food_bite/ui/views/add_address/add_address_view.dart';
import 'package:food_bite/ui/views/add_phone/add_phone_view.dart';
import 'package:food_bite/ui/views/verify_otp/verify_otp_view.dart';
import 'package:food_bite/ui/bottom_sheets/select_country_code/select_country_code_sheet.dart';
import 'package:food_bite/ui/views/add_email/add_email_view.dart';
import 'package:food_bite/ui/views/verify_email/verify_email_view.dart';
import 'package:food_bite/ui/views/reset_password/reset_password_view.dart';
import 'package:food_bite/ui/views/confirm/confirm_view.dart';
import 'package:food_bite/ui/views/navigation/navigation_view.dart';
import 'package:food_bite/services/app_states_service.dart';
import 'package:food_bite/services/local_storage_service.dart';
import 'package:food_bite/ui/views/menu/menu_view.dart';
import 'package:food_bite/ui/views/cart/cart_view.dart';
import 'package:food_bite/ui/views/orders/orders_view.dart';
import 'package:food_bite/ui/views/profile/profile_view.dart';
import 'package:food_bite/ui/views/track/track_view.dart';
import 'package:food_bite/ui/views/history/history_view.dart';
import 'package:food_bite/ui/views/item_details/item_details_view.dart';
import 'package:food_bite/ui/views/checkout/checkout_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: AddAddressView),
    MaterialRoute(page: AddPhoneView),
    MaterialRoute(page: VerifyOtpView),
    MaterialRoute(page: AddEmailView),
    MaterialRoute(page: VerifyEmailView),
    MaterialRoute(page: ResetPasswordView),
    MaterialRoute(page: ConfirmView),
    MaterialRoute(page: NavigationView),
    MaterialRoute(page: MenuView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: OrdersView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: TrackView),
    MaterialRoute(page: HistoryView),
    MaterialRoute(page: ItemDetailsView),
    MaterialRoute(page: CheckoutView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AppStatesService),
    LazySingleton(classType: LocalStorageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: SelectCountryCodeSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
