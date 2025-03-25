import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_image_widget.dart';
import 'confirm_viewmodel.dart';

class ConfirmView extends StackedView<ConfirmViewModel> {
  const ConfirmView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            // Centered content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: AppImages.check,
                    width: 82.w,
                    height: 82.h,
                    fit: BoxFit.contain,
                  ),
                  16.verticalSpace, // Added spacing for better visual balance
                  Text(
                    textAlign: TextAlign.center,
                    'Success',
                    style: AppTextStyles.xlBold,
                  ),
                  6.verticalSpace,
                  Text(
                    textAlign: TextAlign.center,
                    'Congratulations!  Your password has been changed.',
                    style: AppTextStyles.mediumLight.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                ],
              ),
            ),
            // Bottom button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: CustomElevatedButton(
                text: "Login",
                onPressed: () {
                  // Add navigation or action here
                  viewModel.navigateToLoginView();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConfirmViewModel viewModelBuilder(BuildContext context) => ConfirmViewModel();
}
