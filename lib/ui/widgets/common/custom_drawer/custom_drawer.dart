import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/assets.dart';
import '../../../common/text_styles.dart';
import '../../custom_image_widget.dart';
import 'custom_drawer_model.dart';

class CustomDrawer extends StackedView<CustomDrawerModel> {
  const CustomDrawer({
    super.key,
    required this.onTapHome,
    required this.onCloseTap,
    required this.onTapMenu,
    required this.onTapCart,
    required this.onTapOrders,
    required this.onTapProfile,
    required this.onLogOut,
    required this.selectedDrawerIndex, // Add selected index parameter
  });

  final void Function() onCloseTap;
  final void Function() onTapHome;
  final void Function() onTapMenu;
  final void Function() onTapCart;
  final void Function() onTapOrders;
  final void Function() onTapProfile;
  final void Function() onLogOut;
  final int selectedDrawerIndex; // Store the selected index

  @override
  Widget builder(
    BuildContext context,
    CustomDrawerModel viewModel,
    Widget? child,
  ) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.r)),
      backgroundColor: AppColors.white,
      elevation: 0,
      width: 0.8.sw,
      child: Padding(
        padding: EdgeInsets.only(left: 24.w, top: 62.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: onCloseTap,
                  child: Container(
                    padding: EdgeInsets.all(6.r),
                    decoration: BoxDecoration(
                      color: AppColors.gray50,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 24.sp,
                      color: AppColors.red90,
                      weight: 30,
                    ),
                  ),
                ),
              ],
            ),
            30.verticalSpace,
            CustomImageView(
              imagePath: AppImages.profile,
              height: 54.h,
              width: 54.w,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(15.r),
            ),
            8.verticalSpace,
            Text(
              viewModel.storageService.userName ?? 'User',
              style: AppTextStyles.mediumBold.copyWith(
                color: AppColors.headingColor,
              ),
            ),
            Text(
              viewModel.storageService.email ?? 'user@email.com',
              style: AppTextStyles.xsRegular.copyWith(
                color: AppColors.gray500,
                fontWeight: FontWeight.w500,
              ),
            ),
            43.verticalSpace,
            buildDrawerIconContainer(
              label: 'Home',
              iconPath: AppIcons.home,
              onTap: onTapHome,
              isSelected: selectedDrawerIndex == 0, // Check if selected
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: 'Menu',
              iconPath: AppIcons.menu,
              onTap: onTapMenu,
              isSelected: selectedDrawerIndex == 1,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: 'Cart',
              iconPath: AppIcons.cart,
              onTap: onTapCart,
              isSelected: selectedDrawerIndex == 2,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: 'Orders',
              iconPath: AppIcons.orders,
              onTap: onTapOrders,
              isSelected: selectedDrawerIndex == 3,
            ),
            10.verticalSpace,
            buildDrawerIconContainer(
              label: 'Profile',
              iconPath: AppIcons.profile,
              onTap: onTapProfile,
              isSelected: selectedDrawerIndex == 4,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 20.h),
              child: SizedBox(
                width: 157.w,
                child: CustomElevatedButton(
                  text: 'Logout',
                  onPressed: onLogOut,
                  iconPath: AppIcons.logout,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerIconContainer({
    required String label,
    required String iconPath,
    required void Function() onTap,
    required bool isSelected, // Add isSelected parameter
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 157.w,
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.red10
              : Colors.transparent, // Conditional background
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomImageView(
              svgPath: iconPath,
              height: 24.h,
              width: 24.w,
              fit: BoxFit.fill,
              color: AppColors.red90,
            ),
            8.horizontalSpace,
            Text(
              label,
              style: AppTextStyles.mediumBold.copyWith(
                color: AppColors.headingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CustomDrawerModel viewModelBuilder(BuildContext context) =>
      CustomDrawerModel();
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  final String iconPath;
  final String label;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            svgPath: iconPath,
            height: 20.h,
            width: 20.w,
            fit: BoxFit.fill,
            color: AppColors.gray500,
          ),
          12.horizontalSpace,
          Text(
            label,
            style: AppTextStyles.mRegular.copyWith(
              color: AppColors.gray500,
            ),
          ),
        ],
      ),
    );
  }
}
