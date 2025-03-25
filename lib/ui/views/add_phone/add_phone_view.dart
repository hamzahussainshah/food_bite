import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import 'add_phone_viewmodel.dart';

class AddPhoneView extends StackedView<AddPhoneViewModel> {
  const AddPhoneView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddPhoneViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 48.h,
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
                        'Get started with Foobite',
                        style: AppTextStyles.xlBold,
                      ),
                      6.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        'Enter your phone number',
                        style: AppTextStyles.mediumLight.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                      40.verticalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: viewModel.isEnabled
                                    ? AppColors.red90
                                    : AppColors.gray500,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                16.horizontalSpace,
                                InkWell(
                                  onTap: viewModel.showCountrySelector,
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: AppIcons.countryFlag(
                                            viewModel.country['code']
                                                .toLowerCase()),
                                        height: 30.h,
                                        width: 30.w,
                                        fit: BoxFit.fill,
                                        radius: BorderRadius.circular(100.r),
                                      ),
                                      12.horizontalSpace,
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.gray500,
                                      ),
                                    ],
                                  ),
                                ),
                                10.horizontalSpace,
                                Text(
                                  viewModel.country['dial_code'],
                                  style: AppTextStyles.regular.copyWith(
                                    color: AppColors.gray800,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    focusNode: viewModel.phoneFocus,
                                    cursorColor: AppColors.gray500,
                                    cursorHeight: 22.h,
                                    cursorWidth: 1.w,
                                    cursorRadius: Radius.circular(0.3.r),
                                    onTap: () {
                                      viewModel.isEnabled = true;
                                      viewModel.notifyListeners();
                                    },
                                    onTapOutside: (value) {
                                      viewModel.isEnabled = false;
                                      viewModel.notifyListeners();
                                    },
                                    controller: viewModel.phoneController,
                                    onChanged: (value) {
                                      viewModel.onPhoneChanged();
                                      viewModel.validatePhoneNumber();
                                    },
                                    keyboardType: TextInputType.phone,
                                    style: AppTextStyles.regular.copyWith(
                                      color: AppColors.textColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          '${viewModel.country['dial_code']} (00) 000 00 00',
                                      hintStyle: AppTextStyles.regular.copyWith(
                                        color: const Color(0xFFA1A1AA),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 12.h,
                                        horizontal: 10.w,
                                      ),
                                      border: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (viewModel.errorMessage != null)
                            Padding(
                              padding: EdgeInsets.only(top: 8.h, left: 16.w),
                              child: Text(
                                viewModel.errorMessage!,
                                style: TextStyle(
                                  color: AppColors.red90,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                        ],
                      ),
                      24.verticalSpace,
                      CustomElevatedButton(
                        onPressed: () {
                          viewModel.validatePhoneNumber();
                          if (viewModel.formKey.currentState!.validate()) {
                            viewModel.onNext();
                          }
                        },
                        text: 'Next',
                      ),
                    ],
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
  AddPhoneViewModel viewModelBuilder(BuildContext context) =>
      AddPhoneViewModel();
}
