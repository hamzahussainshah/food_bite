import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import '../../widgets/custom_text_field.dart';
import 'signup_viewmodel.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ModalProgressHUD(
          color: Colors.black54,
          opacity: 1,
          progressIndicator: LoadingAnimationWidget.beat(
            size: 40,
            color: AppColors.red90,
          ),
          inAsyncCall: viewModel.isBusy,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 35.w,
              vertical: 24.h,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    30.verticalSpace,
                    CustomImageView(
                      imagePath: AppImages.loginLogoContainer,
                      height: 160.h,
                      width: 174.w,
                      fit: BoxFit.contain,
                    ),
                    48.verticalSpace,
                    Text(
                      'Hello! Create Account',
                      style: AppTextStyles.xlBold,
                    ),
                    8.verticalSpace,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTextStyles.mediumLight.copyWith(
                          color: AppColors.gray500,
                        ),
                        children: [
                          const TextSpan(text: "Already have an account? "),
                          WidgetSpan(
                            child: InkWell(
                              onTap: () {
                                viewModel.navigateToLogInView();
                              },
                              child: Text(
                                "Log in",
                                style: AppTextStyles.mediumLight.copyWith(
                                  color: AppColors.red90,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    24.verticalSpace,
                    CustomTextField(
                      hintText: 'Name',
                      controller: viewModel.nameController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }
                        return null;
                      },
                    ),
                    16.verticalSpace,
                    CustomTextField(
                      hintText: 'Email',
                      controller: viewModel.emailController,
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: AppColors.gray500,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }
                        return null;
                      },
                    ),
                    16.verticalSpace,
                    CustomTextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      hintText: 'phone',
                      controller: viewModel.phoneController,
                      suffixIcon: Icon(
                        Icons.check_circle,
                        color: AppColors.gray500,
                      ),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Phone number is required';
                        }
                        return null;
                      },
                    ),
                    16.verticalSpace,
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
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        }
                        return null;
                      },
                    ),
                    Text(
                      'Add Address',
                      style: AppTextStyles.mediumLight.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      hintText: 'Street',
                      controller: viewModel.streetController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Street is required';
                        }
                        return null;
                      },
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      hintText: 'City',
                      controller: viewModel.cityController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'City is required';
                        }
                        return null;
                      },
                    ),
                    10.verticalSpace,
                    CustomTextField(
                      hintText: 'Postal code',
                      controller: viewModel.postalCodeController,
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Postal code is required';
                        }
                        return null;
                      },
                    ),
                    10.verticalSpace,
                    CustomTextField(
                        hintText: 'Country',
                        controller: viewModel.countryController,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Country is required';
                          }
                          return null;
                        }),
                    16.verticalSpace,
                    CustomElevatedButton(
                      text: 'Sign Up',
                      onPressed: () {
                        if (viewModel.formKey.currentState!.validate()) {
                          viewModel.signUpWithPhoneAndPassword();
                        }
                      },
                    ),
                    16.verticalSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.gray500,
                            thickness: 1,
                            endIndent: 10.w,
                          ),
                        ),
                        Text(
                          'Or',
                          style: AppTextStyles.mediumLight.copyWith(
                            color: AppColors.gray500,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.gray500,
                            thickness: 1,
                            indent: 10.w,
                          ),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    buildSocialContainer(
                      text: 'Sign in with Google',
                      imagePath: AppImages.googleLogo,
                      backgroundColor: AppColors.blue.withValues(
                        alpha: 0.05,
                      ),
                    ),
                    8.verticalSpace,
                    buildSocialContainer(
                      text: 'Sign in with Facebook',
                      imagePath: AppImages.facebookLogo,
                      backgroundColor: AppColors.gray50,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Container buildSocialContainer({
    required String text,
    required String imagePath,
    required Color backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      width: double.infinity,
      height: 52.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo on the left
          CustomImageView(
            imagePath: imagePath,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.contain,
          ),
          // Spacer pushes the text to center
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: AppTextStyles.mediumLight.copyWith(
                color: AppColors.headingColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
