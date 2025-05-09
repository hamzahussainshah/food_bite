import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'account_information_viewmodel.dart';

class AccountInformationView extends StackedView<AccountInformationViewModel> {
  const AccountInformationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AccountInformationViewModel viewModel,
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
                        label: "Full Name",
                        hintText: "Enter your full name",
                        controller: viewModel.nameController,
                      ),
                      20.verticalSpace,

                      // Email Address
                      _buildInfoField(
                        label: "Email Address",
                        hintText: "Enter your email address",
                        controller: viewModel.emailController,
                      ),
                      20.verticalSpace,

                      // Phone Number
                      _buildInfoField(
                        label: "Phone Number",
                        hintText: "Enter your phone number",
                        controller: viewModel.phoneNumberController,
                      ),
                    ],
                  ),
                ),
              ),
              CustomElevatedButton(
                text: "Change Settings",
                onPressed: () {},
              ),
            ],
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
          hintText: hintText,
          controller: controller,
        )
      ],
    );
  }

  @override
  AccountInformationViewModel viewModelBuilder(BuildContext context) =>
      AccountInformationViewModel();
}
