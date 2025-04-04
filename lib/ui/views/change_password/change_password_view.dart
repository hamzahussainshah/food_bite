import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text_field.dart';
import 'change_password_viewmodel.dart';

class ChangePasswordView extends StackedView<ChangePasswordViewModel> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChangePasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Account Information",
        onBackPressed: () {
          viewModel.back();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Account information card
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name
                        _buildInfoField(
                          label: "Password",
                          hintText: "Enter your Password",
                          controller: viewModel.currentPasswordController,
                          obscure: viewModel.obscureCurrentPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.obscureCurrentPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.gray500,
                            ),
                            onPressed: () {
                              viewModel.toggleCurrentPasswordVisibility();
                            },
                          ),
                        ),
                        20.verticalSpace,

                        // Email Address
                        _buildInfoField(
                          label: "New Password",
                          hintText: "Enter your new password",
                          controller: viewModel.newPasswordController,
                          obscure: viewModel.obscureNewPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.obscureNewPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.gray500,
                            ),
                            onPressed: () {
                              viewModel.toggleNewPasswordVisibility();
                            },
                          ),
                        ),
                        20.verticalSpace,

                        // Phone Number
                        _buildInfoField(
                          label: "Confirm Password",
                          hintText: "Re-enter your new password",
                          controller: viewModel.confirmPasswordController,
                          obscure: viewModel.obscureConfirmPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              viewModel.obscureConfirmPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.gray500,
                            ),
                            onPressed: () {
                              viewModel.toggleConfirmPasswordVisibility();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomElevatedButton(
                  text: "Change Password",
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build each info field
  Widget _buildInfoField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.xsMedium.copyWith(
            color: AppColors.gray80,
          ),
        ),
        5.verticalSpace,
        CustomTextField(
          obscure: obscure,
          hintText: hintText,
          controller: controller,
          suffixIcon: suffixIcon,
        )
      ],
    );
  }

  @override
  ChangePasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChangePasswordViewModel();
}
