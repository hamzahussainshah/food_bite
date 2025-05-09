import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import 'verify_email_viewmodel.dart';

class VerifyEmailView extends StackedView<VerifyEmailViewModel> {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerifyEmailViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: AppImages.nearByIcon,
                  width: 160.w,
                  height: 160.h,
                  fit: BoxFit.contain,
                ),
                48.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  'Verify your identity',
                  style: AppTextStyles.xlBold,
                ),
                6.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  'We have just sent a code to jos.creative@gmail.com.',
                  style: AppTextStyles.mediumLight.copyWith(
                    color: AppColors.gray500,
                  ),
                ),
                40.verticalSpace,
                Pinput(
                  length: 6,
                  controller: viewModel.otpController,
                  defaultPinTheme: PinTheme(
                    width: 56.w,
                    height: 56.h,
                    textStyle: AppTextStyles.xlBold.copyWith(
                      color: AppColors.gray800,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.gray500,
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56.w,
                    height: 56.h,
                    textStyle: AppTextStyles.xlBold.copyWith(
                      color: AppColors.gray800,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.red90,
                      ),
                    ),
                  ),
                ),
                24.verticalSpace,
                CustomElevatedButton(
                  onPressed: () {
                    // if (viewModel.formKey.currentState!.validate()) {
                    viewModel.onContinue();
                    // }
                  },
                  text: 'Next',
                ),
                CustomElevatedButton(
                    text: 'Send again',
                    backgroundColor: AppColors.gray500,
                    borderColor: Colors.transparent,
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  VerifyEmailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyEmailViewModel();
}
