import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Row(
                  children: [
                    CustomImageView(
                      imagePath: AppImages.profile,
                      width: 65.w,
                      height: 65.h,
                      fit: BoxFit.cover,
                    ),
                    15.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Addyson Griffith',
                          style: AppTextStyles.mMedium.copyWith(
                            color: AppColors.headingColor,
                          ),
                        ),
                        5.verticalSpace,
                        Text(
                          'addysongriffith@gmail.com',
                          style: AppTextStyles.xsMedium.copyWith(
                            color: AppColors.gray500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                30.verticalSpace,
                // General Section
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.white,
                    border: Border.all(
                      color: AppColors.gray200,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.r),
                        child: Text(
                          'GENERAL',
                          style: AppTextStyles.xsMedium.copyWith(
                            color: AppColors.headingColor,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        color: AppColors.gray200,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: Column(
                          children: [
                            _buildOptionCard(
                              context: context,
                              icon: Icons.person,
                              title: 'Account Information',
                              subtitle: 'Change your Account Information',
                              onTap: () {
                                viewModel.navigateToAccountInfo();
                              },
                            ),
                            buildDividerWithPadding(),

                            // Password
                            _buildOptionCard(
                              context: context,
                              icon: CupertinoIcons.padlock_solid,
                              title: 'Password',
                              subtitle: 'Change your Password',
                              onTap: () {
                                viewModel.navigateToChangePassword();
                              },
                            ),
                            buildDividerWithPadding(),

                            // Payment Methods
                            _buildOptionCard(
                              context: context,
                              icon: CupertinoIcons.creditcard_fill,
                              title: 'Payment Methods',
                              subtitle: 'Add your Credit & Debit cards',
                              onTap: () {
                                viewModel.navigateToPaymentMethods();
                              },
                            ),
                            buildDividerWithPadding(),

                            // Delivery Locations
                            _buildOptionCard(
                              context: context,
                              icon: Icons.location_on_rounded,
                              title: 'Delivery Locations',
                              subtitle: 'Change your Delivery Locations',
                              onTap: () {
                                viewModel.navigateToDeliveryLocations();
                              },
                            ),
                            buildDividerWithPadding(),
                            // Invite Friends
                            _buildOptionCard(
                              context: context,
                              icon: Icons.alternate_email,
                              title: 'Invite your friends',
                              subtitle: 'Get \$59 for each invitation!',
                              onTap: () {
                                viewModel.navigateToInviteFriends();
                              },
                            ),
                            20.verticalSpace, // Padding at the bottom
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                15.verticalSpace,
                // Account Information
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildDividerWithPadding() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Divider(
        height: 1.0,
        color: AppColors.gray50,
      ),
    );
  }

  Widget _buildOptionCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: AppColors.gray50,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.gray80,
              size: 24.sp,
            ),
            15.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.mMedium.copyWith(
                      color: AppColors.headingColor,
                    ),
                  ),
                  5.verticalSpace,
                  Text(
                    subtitle,
                    style: AppTextStyles.xsMedium.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.gray500,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
