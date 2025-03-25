import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/ui/views/cart/cart_view.dart';
import 'package:food_bite/ui/views/history/history_view.dart';
import 'package:food_bite/ui/views/home/home_view.dart';
import 'package:food_bite/ui/views/menu/menu_view.dart';
import 'package:food_bite/ui/views/orders/orders_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_image_widget.dart';
import '../profile/profile_view.dart';
import '../track/track_view.dart';

class NavigationViewModel extends IndexTrackingViewModel {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BottomSheetService _bottomSheetService = locator<BottomSheetService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  bool isDrawerOpen = false;
  int drawerIndex = 0;
  int selectedDrawerIndex = 0; // Initialize to 0 (Home) to match initial state

  List<Widget> drawerScreens = [
    const HomeView(),
    const MenuView(),
    const CartView(),
    const OrdersView(),
    const ProfileView(),
  ];

  List<String> drawerLabels = const [
    "Home",
    "Menu",
    "Cart",
    "Orders",
    "Profile",
  ];

  void onDrawerItemTap(int index) {
    drawerIndex = index; // Update the drawer index
    selectedDrawerIndex = index; // Update the selected drawer index
    isDrawerOpen = true; // Set drawer open state to true
    scaffoldKey.currentState?.closeDrawer(); // Close the drawer after selection
    notifyListeners(); // Notify listeners to rebuild the UI
  }

  List<BottomNavigationBarItem> getBottomNavBarItems(int selectedINDEX) {
    // Define unfilled and filled SVG paths for each icon
    List<String> navigationIconsUnfilled = [
      AppIcons.home,
      AppIcons.location,
      AppIcons.history,
      AppIcons.profile,
    ];

    List<String> navigationIconsFilled = [
      AppIcons.homeFilled,
      AppIcons.locationFilled,
      AppIcons.historyFilled,
      AppIcons.profileFilled,
    ];

    return List.generate(
      bottomNavLabels.length,
      (index) => BottomNavigationBarItem(
        icon: Container(
          decoration: BoxDecoration(
            color:
                index == selectedINDEX ? AppColors.red10 : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding:
              EdgeInsets.only(left: 8.w, right: 8.w, top: 6.h, bottom: 6.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon (filled if selected, unfilled if not)
              CustomImageView(
                svgPath: index == selectedINDEX
                    ? navigationIconsFilled[index]
                    : navigationIconsUnfilled[index],
                height: 24.0.h,
                width: 24.0.w,
              ),
              4.horizontalSpace,
              // Label in front of the icon
              Text(
                bottomNavLabels[index],
                style: AppTextStyles.xsRegular2.copyWith(
                  color: index == selectedINDEX
                      ? AppColors.red90
                      : Colors.transparent,
                  fontSize: 12.sp,
                  fontWeight: index == selectedINDEX
                      ? FontWeight.w500
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        label: '',
      ),
    );
  }

  List<String> bottomNavLabels = const [
    "Home",
    "Track",
    "History",
    "Profile",
  ];

  List<Widget> get bottomNavScreen => [
        const HomeView(),
        const TrackView(),
        const HistoryView(),
        const ProfileView(),
      ];

  void changeLocation() {
    // Example: Navigate to a location picker screen
    _navigationService.navigateTo('location_picker_route');
  }

  // Method to open the drawer
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
    notifyListeners();
  }

  void navigateToMenuView() {
    _navigationService.navigateToMenuView();
  }

  void navigateToCartView() {
    _navigationService.navigateToCartView();
  }

  void navigateToOrdersView() {
    _navigationService.navigateToOrdersView();
  }
}
