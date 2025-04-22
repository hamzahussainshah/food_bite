import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import '../../widgets/custom_text_field.dart';
import 'reset_password_viewmodel.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ResetPasswordViewModel viewModel,
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
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: screenHeight(context) - 100.h,
                ),
                child: Center(
                  child: Form(
                    key: viewModel.formKey,
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
                          'Reset your password',
                          style: AppTextStyles.xlBold,
                        ),
                        6.verticalSpace,
                        Text(
                          textAlign: TextAlign.center,
                          'At least 8 characters, with uppercase and lowercase letters.',
                          style: AppTextStyles.mediumLight.copyWith(
                            color: AppColors.gray500,
                          ),
                        ),
                        40.verticalSpace,
                        CustomTextField(
                          hintText: 'Password',
                          controller: viewModel.passwordController,
                          obscure: viewModel.isObscure,
                          suffixIcon: Icon(
                            viewModel.isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.gray500,
                          ),
                          onTapSuffix: () {
                            viewModel.togglePasswordVisibility();
                          },
                        ),
                        16.verticalSpace,
                        CustomTextField(
                          hintText: 'Confirm Password',
                          controller: viewModel.confirmPasswordController,
                          obscure: viewModel.isObscureConfirm,
                          suffixIcon: Icon(
                            viewModel.isObscureConfirm
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.gray500,
                          ),
                          onTapSuffix: () {
                            viewModel.toggleConfirmPasswordVisibility();
                          },
                        ),
                        24.verticalSpace,
                        CustomElevatedButton(
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              viewModel.onUpdate();
                            }
                          },
                          text: 'Update',
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
    );
  }

  @override
  ResetPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ResetPasswordViewModel();
}
