import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
    return viewModel.isLoading
        ? Scaffold(
            backgroundColor: AppColors.white,
            body: const Center(
              child: CircularProgressIndicator(
                color: AppColors.red90,
              ),
            ),
          )
        : ModalProgressHUD(
            inAsyncCall: viewModel.isBusy,
            color: Colors.black54,
            opacity: 1,
            progressIndicator: LoadingAnimationWidget.beat(
              color: AppColors.red90,
              size: 40,
            ),
            child: Scaffold(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Delivery Address Section
                      if (viewModel.userProfile!.addresses.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery Address",
                              style: AppTextStyles.lSemibold,
                            ),
                            16.verticalSpace,
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  viewModel.userProfile!.addresses.length,
                              itemBuilder: (context, index) {
                                final address =
                                    viewModel.userProfile!.addresses[index];
                                return Container(
                                  margin: EdgeInsets.only(bottom: 16.h),
                                  padding: EdgeInsets.all(16.r),
                                  decoration: BoxDecoration(
                                    color: AppColors.gray50,
                                    borderRadius: BorderRadius.circular(12.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.red60
                                            .withValues(alpha: 0.3),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${address.street}, ${address.city}, ${address.country}",
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
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Radio<int>(
                                        value: index,
                                        groupValue:
                                            viewModel.selectedAddressIndex,
                                        onChanged: (value) {
                                          if (value != null) {
                                            viewModel.selectAddress(value);
                                          }
                                        },
                                        activeColor: AppColors.red90,
                                        fillColor: MaterialStateProperty
                                            .resolveWith<Color>((states) {
                                          if (states.contains(
                                              MaterialState.selected)) {
                                            return AppColors.red90;
                                          }
                                          return AppColors.gray500;
                                        }),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      24.verticalSpace,
                      //
                      // // Add a New Address Section
                      // Text(
                      //   "Update your address",
                      //   style: AppTextStyles.lSemibold,
                      // ),
                      // 16.verticalSpace,
                      // CustomTextField(
                      //   hintText: "Street",
                      //   controller: viewModel.streetController,
                      // ),
                      // 16.verticalSpace,
                      // CustomTextField(
                      //   hintText: "City",
                      //   controller: viewModel.cityController,
                      // ),
                      // 16.verticalSpace,
                      // CustomTextField(
                      //   hintText: "Postal Code",
                      //   controller: viewModel.postalCodeController,
                      // ),
                      // 16.verticalSpace,
                      // CustomTextField(
                      //   hintText: "Country",
                      //   controller: viewModel.countryController,
                      // ),
                      // 16.verticalSpace,
                      // CustomElevatedButton(
                      //   text: "Update",
                      //   onPressed: () {
                      //     viewModel.updateAddress();
                      //   },
                      // ),
                      // 32.verticalSpace,

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
                          viewModel.placeOrder(context);
                        },
                      ),
                      20.verticalSpace, // Bottom padding
                    ],
                  ),
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
