import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
      body: ModalProgressHUD(
        color: Colors.black54,
        opacity: 1,
        progressIndicator: LoadingAnimationWidget.beat(
          size: 40,
          color: AppColors.red90,
        ),
        inAsyncCall: viewModel.isBusy,
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom -
                        48.h,
                  ),
                  child: IntrinsicHeight(
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            'We have just sent a code to ${viewModel.email ?? "jos.creative@gmail.com."}',
                            style: AppTextStyles.mediumLight.copyWith(
                              color: AppColors.gray500,
                            ),
                          ),
                          40.verticalSpace,
                          Pinput(
                            length: 6,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter OTP';
                              } else if (value.length < 6) {
                                return 'Please enter 6 digit OTP';
                              } else {
                                return null;
                              }
                            },
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
                              if (viewModel.formKey.currentState!.validate()) {
                                viewModel.onNext();
                              }
                            },
                            text: 'Next',
                          ),
                          16.verticalSpace,
                          CustomElevatedButton(
                            text: viewModel.isTimerRunning
                                ? 'Send again (${viewModel.remainingSeconds}s)'
                                : 'Send again',
                            textColor: viewModel.isTimerRunning
                                ? AppColors.gray500
                                : AppColors.black,
                            backgroundColor: AppColors.gray150,
                            borderColor: Colors.transparent,
                            onPressed: viewModel.isTimerRunning
                                ? null // Disable the button while timer is running
                                : () {
                                    viewModel.resendOTP();
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  VerifyEmailViewModel viewModelBuilder(BuildContext context) =>
      VerifyEmailViewModel();
}
