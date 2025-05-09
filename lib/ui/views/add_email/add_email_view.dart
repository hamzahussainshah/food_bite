import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import 'add_email_viewmodel.dart';

class AddEmailView extends StackedView<AddEmailViewModel> {
  const AddEmailView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddEmailViewModel viewModel,
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
            child: SizedBox.expand(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height - 100.h,
                  ),
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
                          'Password Recovery',
                          style: AppTextStyles.xlBold,
                        ),
                        6.verticalSpace,
                        Text(
                          textAlign: TextAlign.center,
                          'Enter your email to recover your password',
                          style: AppTextStyles.mediumLight.copyWith(
                            color: AppColors.gray500,
                          ),
                        ),
                        40.verticalSpace,
                        CustomTextField(
                          hintText: 'Enter your email',
                          controller: viewModel.emailController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          suffixIcon: Icon(
                            Icons.check_circle,
                            size: 24.sp,
                          ),
                        ),
                        24.verticalSpace,
                        CustomElevatedButton(
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (viewModel.formKey!.currentState!.validate()) {
                              viewModel.onContinue();
                            }
                          },
                          text: 'Continue',
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
  AddEmailViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddEmailViewModel();
}
