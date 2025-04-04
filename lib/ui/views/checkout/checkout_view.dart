import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'checkout_viewmodel.dart';

class CheckoutView extends StackedView<CheckoutViewModel> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CheckoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () {
            viewModel.navigateBack();
          },
        ),
        title: Text(
          "Checkout",
          style: AppTextStyles.xlSemibold,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delivery Address Section
              if (viewModel.addresses.isNotEmpty)
                Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: AppColors.gray50,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.red60.withValues(alpha: 0.3),
                        blurRadius: 8.r,
                        spreadRadius: 0.r,
                        offset: Offset(0, 18.h),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        imagePath: AppImages.maps,
                        height: 65.h,
                        width: 65.w,
                        radius: BorderRadius.circular(12.r),
                      ),
                      16.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.addresses[0]["address"],
                              style: AppTextStyles.xsRegular,
                            ),
                            4.verticalSpace,
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 24.sp,
                                  color: AppColors.gray500,
                                ),
                                4.horizontalSpace,
                                Text(
                                  "${viewModel.addresses[0]["distance"]}",
                                  style: AppTextStyles.xsRegular.copyWith(
                                    color: AppColors.gray500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              24.verticalSpace,

              // Add a New Address Section
              Text(
                "Add a new address",
                style: AppTextStyles.lSemibold,
              ),
              16.verticalSpace,
              CustomTextField(
                hintText: "Full Name",
                onChanged: (value) =>
                    viewModel.updateFormField("fullName", value),
                controller: viewModel.nameController,
              ),
              16.verticalSpace,
              CustomTextField(
                hintText: "Phone Number",
                onChanged: (value) =>
                    viewModel.updateFormField("phoneNumber", value),
                keyboardType: TextInputType.phone,
                controller: viewModel.phoneController,
              ),
              16.verticalSpace,
              CustomTextField(
                hintText: "Delivery Address",
                onChanged: (value) =>
                    viewModel.updateFormField("deliveryAddress", value),
                controller: viewModel.addressController,
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "Pincode",
                      onChanged: (value) =>
                          viewModel.updateFormField("pincode", value),
                      keyboardType: TextInputType.number,
                      controller: viewModel.pinCodeController,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: CustomTextField(
                      hintText: "City & State",
                      onChanged: (value) =>
                          viewModel.updateFormField("cityAndState", value),
                      controller: viewModel.cityController,
                    ),
                  ),
                ],
              ),
              32.verticalSpace,

              // Payment Options Section
              Text(
                "Payment Options",
                style: AppTextStyles.lSemibold.copyWith(
                  color: AppColors.headingColor,
                ),
              ),
              16.verticalSpace,
              ...viewModel.paymentOptions.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> option = entry.value;
                return _buildPaymentOption(
                  index: index,
                  icon: option["icon"],
                  name: option["name"],
                  isSelected: option["isSelected"],
                  isAdd: option["isAdd"],
                  onTap: () => viewModel.selectPaymentOption(index),
                  onAddTap: () {
                    viewModel.navigateToAddPaymentView();
                  },
                  viewModel: viewModel,
                );
              }).toList(),
              32.verticalSpace,

              // Place Order Button
              CustomElevatedButton(
                text: "Place Order",
                onPressed: () {
                  viewModel.placeOrder();
                },
              ),
              20.verticalSpace, // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build payment option
  Widget _buildPaymentOption({
    required bool isAdd,
    required int index,
    required IconData icon,
    required String name,
    required bool isSelected,
    required VoidCallback onTap,
    required VoidCallback onAddTap,
    required CheckoutViewModel viewModel,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.red10,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.headingColor,
              size: 24.sp,
            ),
            16.horizontalSpace,
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.mRegular,
              ),
            ),
            if (isAdd)
              GestureDetector(
                onTap: onAddTap,
                child: Text(
                  "Add",
                  style: AppTextStyles.xsRegular.copyWith(
                    color: AppColors.red90,
                  ),
                ),
              ),
            16.horizontalSpace,
            if (name == "Credit/Debit Card")
              Radio<int>(
                value: index,
                groupValue: viewModel.selectedPaymentOptionIndex,
                onChanged: (value) {
                  if (value != null) {
                    onTap();
                  }
                },
                activeColor: AppColors.red90,
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.red90;
                  }
                  return AppColors.gray500;
                }),
              )
            else
              const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  @override
  CheckoutViewModel viewModelBuilder(BuildContext context) =>
      CheckoutViewModel();
}
