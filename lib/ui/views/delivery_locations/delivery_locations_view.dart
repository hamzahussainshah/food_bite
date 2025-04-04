import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import 'delivery_locations_viewmodel.dart';

class DeliveryLocationsView extends StackedView<DeliveryLocationsViewModel> {
  const DeliveryLocationsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DeliveryLocationsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Delivery Locations",
        onBackPressed: () {
          viewModel.back();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Existing locations (Home and Office)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLocationCard(
                              title: "Home",
                              address: "123 Main Street, City, State, Pincode",
                              onEdit: () {
                                // Add edit functionality for Home address
                              },
                            ),
                            _buildLocationCard(
                              title: "Office",
                              address: "123 Main Street, City, State, Pincode",
                              onEdit: () {
                                // Add edit functionality for Office address
                              },
                            ),
                          ],
                        ),
                        30.verticalSpace,

                        // Add a new address section
                        Text(
                          "Add a new address",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        20.verticalSpace,

                        // Form fields
                        CustomTextField(
                          hintText: "Full Name",
                          controller: viewModel.fullNameController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Full Name is required";
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          hintText: "Phone Number",
                          controller: viewModel.phoneNumberController,
                          keyboardType: TextInputType.phone,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Phone Number is required";
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        CustomTextField(
                          hintText: "Delivery Address",
                          controller: viewModel.addressController,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Address is required";
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                hintText: "Pincode",
                                controller: viewModel.pincodeController,
                                keyboardType: TextInputType.number,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "Pincode is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: CustomTextField(
                                  hintText: "City & State",
                                  controller: viewModel.cityStateController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "City & State is required";
                                    }
                                    return null;
                                  }),
                            ),
                          ],
                        ),

                        30.verticalSpace,
                      ],
                    ),
                  ),
                ),
              ),
              CustomElevatedButton(
                text: "Save",
                onPressed: () {
                  if (viewModel.formKey.currentState!.validate()) {
                    viewModel.saveAddress();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a location card
  Widget _buildLocationCard({
    required String title,
    required String address,
    required VoidCallback onEdit,
  }) {
    return Container(
      width: 150.w, // Fixed width for each card
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.gray50,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.red60.withValues(alpha: 0.3),
            blurRadius: 8.r,
            spreadRadius: 0.r,
            offset: Offset(0, 18.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Text(title,
                  style: AppTextStyles.mSemibold.copyWith(
                    color: AppColors.headingColor,
                  )),
              Spacer(),
              GestureDetector(
                onTap: onEdit,
                child: Icon(
                  Icons.edit,
                  size: 20.sp,
                  color: AppColors.headingColor,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Text(
              textAlign: TextAlign.center,
              address,
              style: AppTextStyles.xsMedium2.copyWith(
                color: AppColors.headingColor,
              )),
        ],
      ),
    );
  }

  @override
  DeliveryLocationsViewModel viewModelBuilder(BuildContext context) =>
      DeliveryLocationsViewModel();
}
