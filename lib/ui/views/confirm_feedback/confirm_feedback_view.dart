import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_image_widget.dart';
import 'confirm_feedback_viewmodel.dart';

class ConfirmFeedbackView extends StackedView<ConfirmFeedbackViewModel> {
  const ConfirmFeedbackView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmFeedbackViewModel viewModel,
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
                30.verticalSpace,
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
                  'You service feedback success',
                  style: AppTextStyles.mMedium.copyWith(
                    color: AppColors.headingColor,
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Text(
                    'Thanks for your feedback on our service.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.xsMedium2.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                ),
                15.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomElevatedButton(
                      text: 'Ok',
                      onPressed: () {
                        viewModel.navigateToNavigationView();
                      }),
                )
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
  ConfirmFeedbackViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConfirmFeedbackViewModel();
}
