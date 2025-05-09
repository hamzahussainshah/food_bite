import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
    return ModalProgressHUD(
      color: Colors.black54,
      opacity: 1,
      progressIndicator: LoadingAnimationWidget.beat(
        size: 40,
        color: AppColors.red90,
      ),
      inAsyncCall: viewModel.isBusy,
      child: Scaffold(
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
                    child: Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Full Name
                          _buildInfoField(
                            label: "Full Name",
                            hintText: "Enter your full name",
                            controller: viewModel.nameController,
                            viewModel: viewModel,
                          ),
                          20.verticalSpace,

                          // Email Address
                          _buildInfoField(
                            readOnly: true,
                            label: "Email Address",
                            hintText: "Enter your email address",
                            controller: viewModel.emailController,
                            viewModel: viewModel,
                          ),
                          20.verticalSpace,

                          // Phone Number
                          _buildInfoField(
                            label: "Phone Number",
                            hintText: "Enter your phone number",
                            controller: viewModel.phoneNumberController,
                            viewModel: viewModel,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                  isDisabled: !(viewModel.nameController.text.isNotEmpty &&
                          viewModel.phoneNumberController.text.isNotEmpty &&
                          viewModel.storageService.phoneNumber !=
                              viewModel.phoneNumberController.text ||
                      viewModel.storageService.userName !=
                          viewModel.nameController.text),
                  text: "Save Changes",
                  onPressed: () {
                    print(viewModel.nameController.text.isNotEmpty &&
                            viewModel.phoneNumberController.text.isNotEmpty &&
                            viewModel.storageService.phoneNumber!.trim() !=
                                viewModel.phoneNumberController.text.trim() ||
                        viewModel.storageService.userName!.trim() !=
                            viewModel.nameController.text.trim());
                    if (viewModel.formKey.currentState!.validate() &&
                            viewModel.storageService.phoneNumber !=
                                viewModel.phoneNumberController.text ||
                        viewModel.storageService.userName !=
                            viewModel.nameController.text) {
                      viewModel.saveChanges();
                    }
                  },
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
    bool readOnly = false,
    required String label,
    required String hintText,
    required TextEditingController controller,
    required AccountInformationViewModel viewModel,
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
          onChanged: (value) {
            viewModel.notifyListeners();
          },
          readOnly: readOnly,
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
