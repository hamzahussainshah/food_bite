// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i35;
import 'package:flutter/material.dart';
import 'package:food_bite/ui/views/account_information/account_information_view.dart'
    as _i29;
import 'package:food_bite/ui/views/add_address/add_address_view.dart' as _i7;
import 'package:food_bite/ui/views/add_card/add_card_view.dart' as _i34;
import 'package:food_bite/ui/views/add_email/add_email_view.dart' as _i10;
import 'package:food_bite/ui/views/add_payment/add_payment_view.dart' as _i23;
import 'package:food_bite/ui/views/add_phone/add_phone_view.dart' as _i8;
import 'package:food_bite/ui/views/cart/cart_view.dart' as _i16;
import 'package:food_bite/ui/views/change_password/change_password_view.dart'
    as _i30;
import 'package:food_bite/ui/views/checkout/checkout_view.dart' as _i22;
import 'package:food_bite/ui/views/confirm/confirm_view.dart' as _i13;
import 'package:food_bite/ui/views/confirm_feedback/confirm_feedback_view.dart'
    as _i28;
import 'package:food_bite/ui/views/confirmation/confirmation_view.dart' as _i24;
import 'package:food_bite/ui/views/delivery_locations/delivery_locations_view.dart'
    as _i31;
import 'package:food_bite/ui/views/history/history_view.dart' as _i20;
import 'package:food_bite/ui/views/home/home_view.dart' as _i2;
import 'package:food_bite/ui/views/item_details/item_details_view.dart' as _i21;
import 'package:food_bite/ui/views/login/login_view.dart' as _i5;
import 'package:food_bite/ui/views/menu/menu_view.dart' as _i15;
import 'package:food_bite/ui/views/navigation/navigation_view.dart' as _i14;
import 'package:food_bite/ui/views/onboarding/onboarding_view.dart' as _i4;
import 'package:food_bite/ui/views/order_details/order_details_view.dart'
    as _i25;
import 'package:food_bite/ui/views/orders/orders_view.dart' as _i17;
import 'package:food_bite/ui/views/payment_cards/payment_cards_view.dart'
    as _i33;
import 'package:food_bite/ui/views/payment_methods/payment_methods_view.dart'
    as _i32;
import 'package:food_bite/ui/views/profile/profile_view.dart' as _i18;
import 'package:food_bite/ui/views/rate_driver/rate_driver_view.dart' as _i26;
import 'package:food_bite/ui/views/rate_your_food/rate_your_food_view.dart'
    as _i27;
import 'package:food_bite/ui/views/reset_password/reset_password_view.dart'
    as _i12;
import 'package:food_bite/ui/views/signup/signup_view.dart' as _i6;
import 'package:food_bite/ui/views/startup/startup_view.dart' as _i3;
import 'package:food_bite/ui/views/track/track_view.dart' as _i19;
import 'package:food_bite/ui/views/verify_email/verify_email_view.dart' as _i11;
import 'package:food_bite/ui/views/verify_otp/verify_otp_view.dart' as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i36;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const addAddressView = '/add-address-view';

  static const addPhoneView = '/add-phone-view';

  static const verifyOtpView = '/verify-otp-view';

  static const addEmailView = '/add-email-view';

  static const verifyEmailView = '/verify-email-view';

  static const resetPasswordView = '/reset-password-view';

  static const confirmView = '/confirm-view';

  static const navigationView = '/navigation-view';

  static const menuView = '/menu-view';

  static const cartView = '/cart-view';

  static const ordersView = '/orders-view';

  static const profileView = '/profile-view';

  static const trackView = '/track-view';

  static const historyView = '/history-view';

  static const itemDetailsView = '/item-details-view';

  static const checkoutView = '/checkout-view';

  static const addPaymentView = '/add-payment-view';

  static const confirmationView = '/confirmation-view';

  static const orderDetailsView = '/order-details-view';

  static const rateDriverView = '/rate-driver-view';

  static const rateYourFoodView = '/rate-your-food-view';

  static const confirmFeedbackView = '/confirm-feedback-view';

  static const accountInformationView = '/account-information-view';

  static const changePasswordView = '/change-password-view';

  static const deliveryLocationsView = '/delivery-locations-view';

  static const paymentMethodsView = '/payment-methods-view';

  static const paymentCardsView = '/payment-cards-view';

  static const addCardView = '/add-card-view';

  static const all = <String>{
    homeView,
    startupView,
    onboardingView,
    loginView,
    signupView,
    addAddressView,
    addPhoneView,
    verifyOtpView,
    addEmailView,
    verifyEmailView,
    resetPasswordView,
    confirmView,
    navigationView,
    menuView,
    cartView,
    ordersView,
    profileView,
    trackView,
    historyView,
    itemDetailsView,
    checkoutView,
    addPaymentView,
    confirmationView,
    orderDetailsView,
    rateDriverView,
    rateYourFoodView,
    confirmFeedbackView,
    accountInformationView,
    changePasswordView,
    deliveryLocationsView,
    paymentMethodsView,
    paymentCardsView,
    addCardView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i4.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i6.SignupView,
    ),
    _i1.RouteDef(
      Routes.addAddressView,
      page: _i7.AddAddressView,
    ),
    _i1.RouteDef(
      Routes.addPhoneView,
      page: _i8.AddPhoneView,
    ),
    _i1.RouteDef(
      Routes.verifyOtpView,
      page: _i9.VerifyOtpView,
    ),
    _i1.RouteDef(
      Routes.addEmailView,
      page: _i10.AddEmailView,
    ),
    _i1.RouteDef(
      Routes.verifyEmailView,
      page: _i11.VerifyEmailView,
    ),
    _i1.RouteDef(
      Routes.resetPasswordView,
      page: _i12.ResetPasswordView,
    ),
    _i1.RouteDef(
      Routes.confirmView,
      page: _i13.ConfirmView,
    ),
    _i1.RouteDef(
      Routes.navigationView,
      page: _i14.NavigationView,
    ),
    _i1.RouteDef(
      Routes.menuView,
      page: _i15.MenuView,
    ),
    _i1.RouteDef(
      Routes.cartView,
      page: _i16.CartView,
    ),
    _i1.RouteDef(
      Routes.ordersView,
      page: _i17.OrdersView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i18.ProfileView,
    ),
    _i1.RouteDef(
      Routes.trackView,
      page: _i19.TrackView,
    ),
    _i1.RouteDef(
      Routes.historyView,
      page: _i20.HistoryView,
    ),
    _i1.RouteDef(
      Routes.itemDetailsView,
      page: _i21.ItemDetailsView,
    ),
    _i1.RouteDef(
      Routes.checkoutView,
      page: _i22.CheckoutView,
    ),
    _i1.RouteDef(
      Routes.addPaymentView,
      page: _i23.AddPaymentView,
    ),
    _i1.RouteDef(
      Routes.confirmationView,
      page: _i24.ConfirmationView,
    ),
    _i1.RouteDef(
      Routes.orderDetailsView,
      page: _i25.OrderDetailsView,
    ),
    _i1.RouteDef(
      Routes.rateDriverView,
      page: _i26.RateDriverView,
    ),
    _i1.RouteDef(
      Routes.rateYourFoodView,
      page: _i27.RateYourFoodView,
    ),
    _i1.RouteDef(
      Routes.confirmFeedbackView,
      page: _i28.ConfirmFeedbackView,
    ),
    _i1.RouteDef(
      Routes.accountInformationView,
      page: _i29.AccountInformationView,
    ),
    _i1.RouteDef(
      Routes.changePasswordView,
      page: _i30.ChangePasswordView,
    ),
    _i1.RouteDef(
      Routes.deliveryLocationsView,
      page: _i31.DeliveryLocationsView,
    ),
    _i1.RouteDef(
      Routes.paymentMethodsView,
      page: _i32.PaymentMethodsView,
    ),
    _i1.RouteDef(
      Routes.paymentCardsView,
      page: _i33.PaymentCardsView,
    ),
    _i1.RouteDef(
      Routes.addCardView,
      page: _i34.AddCardView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.OnboardingView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.OnboardingView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
      );
    },
    _i6.SignupView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SignupView(),
        settings: data,
      );
    },
    _i7.AddAddressView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AddAddressView(),
        settings: data,
      );
    },
    _i8.AddPhoneView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.AddPhoneView(),
        settings: data,
      );
    },
    _i9.VerifyOtpView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.VerifyOtpView(),
        settings: data,
      );
    },
    _i10.AddEmailView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.AddEmailView(),
        settings: data,
      );
    },
    _i11.VerifyEmailView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.VerifyEmailView(),
        settings: data,
      );
    },
    _i12.ResetPasswordView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.ResetPasswordView(),
        settings: data,
      );
    },
    _i13.ConfirmView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ConfirmView(),
        settings: data,
      );
    },
    _i14.NavigationView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.NavigationView(),
        settings: data,
      );
    },
    _i15.MenuView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.MenuView(),
        settings: data,
      );
    },
    _i16.CartView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.CartView(),
        settings: data,
      );
    },
    _i17.OrdersView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.OrdersView(),
        settings: data,
      );
    },
    _i18.ProfileView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.ProfileView(),
        settings: data,
      );
    },
    _i19.TrackView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.TrackView(),
        settings: data,
      );
    },
    _i20.HistoryView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.HistoryView(),
        settings: data,
      );
    },
    _i21.ItemDetailsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ItemDetailsView(),
        settings: data,
      );
    },
    _i22.CheckoutView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.CheckoutView(),
        settings: data,
      );
    },
    _i23.AddPaymentView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.AddPaymentView(),
        settings: data,
      );
    },
    _i24.ConfirmationView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i24.ConfirmationView(),
        settings: data,
      );
    },
    _i25.OrderDetailsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i25.OrderDetailsView(),
        settings: data,
      );
    },
    _i26.RateDriverView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.RateDriverView(),
        settings: data,
      );
    },
    _i27.RateYourFoodView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.RateYourFoodView(),
        settings: data,
      );
    },
    _i28.ConfirmFeedbackView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.ConfirmFeedbackView(),
        settings: data,
      );
    },
    _i29.AccountInformationView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.AccountInformationView(),
        settings: data,
      );
    },
    _i30.ChangePasswordView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i30.ChangePasswordView(),
        settings: data,
      );
    },
    _i31.DeliveryLocationsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i31.DeliveryLocationsView(),
        settings: data,
      );
    },
    _i32.PaymentMethodsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i32.PaymentMethodsView(),
        settings: data,
      );
    },
    _i33.PaymentCardsView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i33.PaymentCardsView(),
        settings: data,
      );
    },
    _i34.AddCardView: (data) {
      return _i35.MaterialPageRoute<dynamic>(
        builder: (context) => const _i34.AddCardView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i36.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddAddressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addAddressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerifyEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verifyEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.navigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.menuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTrackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.trackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToItemDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.itemDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddPaymentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addPaymentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrderDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.orderDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRateDriverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.rateDriverView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRateYourFoodView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.rateYourFoodView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToConfirmFeedbackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.confirmFeedbackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountInformationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountInformationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDeliveryLocationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.deliveryLocationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentMethodsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paymentMethodsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPaymentCardsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.paymentCardsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddCardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addCardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddAddressView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addAddressView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddPhoneView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addPhoneView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyOtpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerifyEmailView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verifyEmailView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResetPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.resetPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNavigationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.navigationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.menuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cartView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrdersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.ordersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTrackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.trackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHistoryView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.historyView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithItemDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.itemDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddPaymentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addPaymentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrderDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.orderDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRateDriverView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.rateDriverView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRateYourFoodView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.rateYourFoodView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithConfirmFeedbackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.confirmFeedbackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountInformationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountInformationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithChangePasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.changePasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDeliveryLocationsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.deliveryLocationsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentMethodsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paymentMethodsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPaymentCardsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.paymentCardsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddCardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addCardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
