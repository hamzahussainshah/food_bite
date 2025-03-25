import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import 'verify_otp_viewmodel.dart';

class VerifyOtpView extends StackedView<VerifyOtpViewModel> {
  const VerifyOtpView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerifyOtpViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 80.h,
                ),
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
                      'Verify phone number',
                      style: AppTextStyles.xlBold,
                    ),
                    6.verticalSpace,
                    Text(
                      textAlign: TextAlign.center,
                      'We have just sent a code to +12025550132.',
                      style: AppTextStyles.mediumLight.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                    40.verticalSpace,
                    Pinput(
                      length: 6,
                      controller: viewModel.otpController,
                      defaultPinTheme: PinTheme(
                        width: 65.w,
                        height: 65.h,
                        textStyle: AppTextStyles.xlBold.copyWith(
                          color: AppColors.gray800,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.gray50,
                          borderRadius: BorderRadius.circular(8.r),
                          border: null,
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 66.w,
                        height: 66.h,
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
                        viewModel.onNext();
                        // }
                      },
                      text: 'Next',
                    ),
                    16.verticalSpace,
                    CustomElevatedButton(
                        text: 'Send again',
                        backgroundColor: AppColors.gray50,
                        borderColor: Colors.transparent,
                        textColor: AppColors.black,
                        onPressed: () {}),
                    16.verticalSpace,
                    Text(
                      'By signing up you agree to',
                      style: AppTextStyles.xsRegular.copyWith(
                        color: AppColors.gray500,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      'our terms of service and privacy policy.',
                      style: AppTextStyles.xsRegular.copyWith(
                        color: AppColors.red90,
                      ),
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  VerifyOtpViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerifyOtpViewModel();
}
