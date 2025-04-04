import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_image_widget.dart';
import 'confirmation_viewmodel.dart';

class ConfirmationView extends StackedView<ConfirmationViewModel> {
  const ConfirmationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          CustomImageView(
            imagePath: AppImages.backgroundConfirmation,
            width: double.infinity,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Checkmark and red dots
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Red checkmark circle
                    Container(
                      margin: EdgeInsets.all(30.r),
                      width: 100.w,
                      height: 100.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    // Red dots around the checkmark
                    Positioned(
                      top: 0,
                      left: 20,
                      child: _buildRedDot(size: 12),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: _buildRedDot(size: 16),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 10,
                      child: _buildRedDot(size: 8),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 0,
                      child: _buildRedDot(size: 10),
                    ),
                  ],
                ),

                30.verticalSpace,
                Text(
                  'You ordered successfully',
                  style: AppTextStyles.mMedium.copyWith(
                    color: AppColors.headingColor,
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'You successfully place an order, your order is confirmed and delivered within 20 minutes. Wish you enjoy the food',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.xsMedium2.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create a red dot
  Widget _buildRedDot({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
    );
  }

  @override
  ConfirmationViewModel viewModelBuilder(BuildContext context) =>
      ConfirmationViewModel();
}
