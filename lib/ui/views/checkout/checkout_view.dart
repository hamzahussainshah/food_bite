import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/text_styles.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: AppColors.gray200,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.location_on,
                          color: AppColors.red90,
                          size: 30.sp,
                        ),
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
                            Text(
                              "📍 ${viewModel.addresses[0]["distance"]}",
                              style: AppTextStyles.xsRegular.copyWith(
                                color: AppColors.gray500,
                              ),
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
              _buildTextField(
                hint: "Full Name",
                onChanged: (value) => viewModel.updateFormField("fullName", value),
              ),
              16.verticalSpace,
              _buildTextField(
                hint: "Phone Number",
                onChanged: (value) => viewModel.updateFormField("phoneNumber", value),
                keyboardType: TextInputType.phone,
              ),
              16.verticalSpace,
              _buildTextField(
                hint: "Delivery Address",
                onChanged: (value) => viewModel.updateFormField("deliveryAddress", value),
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: _buildTextField(
                      hint: "Pincode",
                      onChanged: (value) => viewModel.updateFormField("pincode", value),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: _buildTextField(
                      hint: "City & State",
                      onChanged: (value) => viewModel.updateFormField("cityAndState", value),
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
                  icon: option["icon"],
                  name: option["name"],
                  isSelected: option["isSelected"],
                  onTap: () => viewModel.selectPaymentOption(index),
                );
              }).toList(),
              32.verticalSpace,

              // Place Order Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.placeOrder();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red90,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    "Place Order",
                    style: AppTextStyles.mSemibold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              20.verticalSpace, // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text field
  Widget _buildTextField({
    required String hint,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.xsRegular.copyWith(
          color: AppColors.gray500,
        ),
        filled: true,
        fillColor: AppColors.gray50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
      ),
      style: AppTextStyles.xsRegular,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }

  // Helper method to build payment option
  Widget _buildPaymentOption({
    required IconData icon,
    required String name,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: AppColors.gray50,
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
              if (isSelected)
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.red90,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                )
              else
                Text(
                  "Add",
                  style: AppTextStyles.xsRegular.copyWith(
                    color: AppColors.red90,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CheckoutViewModel viewModelBuilder(BuildContext context) => CheckoutViewModel();
}