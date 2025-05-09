import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../common/assets.dart';
import '../../widgets/common/custom_drawer/custom_drawer.dart';
import '../../widgets/custom_image_widget.dart';
import 'navigation_viewmodel.dart';

class NavigationView extends StackedView<NavigationViewModel> {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NavigationViewModel viewModel,
    Widget? child,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: viewModel.scaffoldKey,
        backgroundColor: AppColors.gray50,
        drawer: CustomDrawer(
          onCloseTap: () => viewModel.scaffoldKey.currentState?.openEndDrawer(),
          onTapHome: () {
            viewModel.setIndex(0);
            viewModel.onDrawerItemTap(0);
          },
          onTapMenu: () {
            viewModel.scaffoldKey.currentState?.openEndDrawer();
            viewModel.navigateToMenuView();
          },
          onTapCart: () {
            viewModel.scaffoldKey.currentState?.openEndDrawer();
            viewModel.navigateToCartView();
          },
          onTapOrders: () {
            viewModel.scaffoldKey.currentState?.openEndDrawer();
            viewModel.navigateToOrdersView();
          },
          onTapProfile: () {
            viewModel.setIndex(3);
            viewModel.onDrawerItemTap(4);
          },
          onLogOut: () {},
          selectedDrawerIndex: viewModel.selectedDrawerIndex,
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // App Bar
              Container(
                color: AppColors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          viewModel.scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          width: 35.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.gray50,
                          ),
                          child: CustomImageView(
                            svgPath: AppIcons.list,
                            fit: BoxFit.cover,
                            width: 26.w,
                            color: AppColors.red90,
                          ),
                        ),
                      ),
                      Spacer(),
                      CustomImageView(
                        svgPath: AppIcons.locationArrow,
                        fit: BoxFit.cover,
                        width: 15.w,
                      ),
                      12.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery to',
                            style: AppTextStyles.xsMedium2.copyWith(
                              color: AppColors.red90,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '1014 Prospect Vall',
                                style: AppTextStyles.mediumLight.copyWith(
                                  color: AppColors.headingColor,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  viewModel.changeLocation();
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColors.red90,
                                  size: 20.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomImageView(
                        width: 32.w,
                        height: 32.h,
                        imagePath: AppImages.profile,
                        fit: BoxFit.cover,
                        radius: BorderRadius.circular(12.r),
                      ),
                    ],
                  ),
                ),
              ),
              // Main Content
              Expanded(
                child: viewModel.isDrawerOpen
                    ? IndexedStack(
                        index: viewModel.drawerIndex,
                        children: viewModel.drawerScreens,
                      )
                    : IndexedStack(
                        index: viewModel.currentIndex,
                        children: viewModel.bottomNavScreens,
                      ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          type: BottomNavigationBarType.fixed,
          items: viewModel.getBottomNavBarItems(viewModel.currentIndex),
          onTap: (index) {
            viewModel.setIndex(index);
            viewModel.isDrawerOpen = false;
            viewModel.notifyListeners();
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.red90,
          unselectedItemColor: AppColors.gray400,
          backgroundColor: AppColors.white,
        ),
      ),
    );
  }

  @override
  void onViewModelReady(NavigationViewModel viewModel) {
    viewModel.setIndex(0);
    viewModel.notifyListeners();
    super.onViewModelReady(viewModel);
  }

  @override
  NavigationViewModel viewModelBuilder(BuildContext context) =>
      NavigationViewModel();
}
