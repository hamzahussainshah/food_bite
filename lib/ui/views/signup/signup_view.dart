import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: 24.h,
          ),
          child: SingleChildScrollView(
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
                ),
                16.verticalSpace,
                CustomTextField(
                  hintText: 'Email',
                  controller: viewModel.emailController,
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: AppColors.gray500,
                  ),
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
                ),
                16.verticalSpace,
                CustomElevatedButton(text: 'Sign Up', onPressed: () {}),
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
