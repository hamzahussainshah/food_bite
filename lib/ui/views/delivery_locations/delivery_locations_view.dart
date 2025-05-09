import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
    return ModalProgressHUD(
      inAsyncCall: viewModel.isBusy,
      color: Colors.black54,
      opacity: 1,
      progressIndicator: LoadingAnimationWidget.beat(
        size: 40,
        color: AppColors.red90,
      ),
      child: Scaffold(
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
                          // Show all saved addresses
                          if (viewModel.addressList.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saved Addresses",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                20.verticalSpace,
                                Wrap(
                                  spacing: 10.w,
                                  runSpacing: 10.h,
                                  children:
                                      viewModel.addressList.map((address) {
                                    return _buildLocationCard(
                                      title: address.street,
                                      address:
                                          "${address.city}, ${address.country}, ${address.postalCode}",
                                      onEdit: () {
                                        viewModel.editAddress(address);
                                      },
                                      onDelete: () {
                                        viewModel.showDeleteDialog(address);
                                      },
                                    );
                                  }).toList(),
                                ),
                                30.verticalSpace,
                              ],
                            ),

                          // Add a new address section
                          Text(
                            "Add New Address",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          20.verticalSpace,

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
                            },
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
      ),
    );
  }

  // Helper method to build a location card
  Widget _buildLocationCard({
    required String title,
    required String address,
    required VoidCallback onEdit,
    required VoidCallback? onDelete,
  }) {
    return Container(
      width: 150.w,
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
            color: AppColors.red60.withValues(
              alpha: 0.3,
            ),
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
            children: [
              InkWell(
                onTap: onDelete,
                child: Icon(
                  Icons.delete,
                  color: AppColors.red90,
                  size: 20.sp,
                ),
              ),
              Spacer(),
              InkWell(
                onTap: onEdit,
                child: Icon(
                  Icons.edit,
                  color: AppColors.black,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              title,
              style: AppTextStyles.mSemibold.copyWith(
                color: AppColors.headingColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          10.verticalSpace,
          Text(
            address,
            textAlign: TextAlign.center,
            style: AppTextStyles.xsMedium2.copyWith(
              color: AppColors.headingColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  DeliveryLocationsViewModel viewModelBuilder(BuildContext context) =>
      DeliveryLocationsViewModel();
}
