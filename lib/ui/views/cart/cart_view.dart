import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'cart_viewmodel.dart';

class CartView extends StackedView<CartViewModel> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CartViewModel viewModel,
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
          "Cart",
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
              // Cart Items
              if (viewModel.cartItems.isEmpty)
                Center(
                  child: Text(
                    "Your cart is empty",
                    style: AppTextStyles.mRegular.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                )
              else
                Column(
                  children: viewModel.cartItems.asMap().entries.map((entry) {
                    int index = entry.key;
                    Map<String, dynamic> item = entry.value;
                    return _buildCartItem(
                      index: index,
                      imagePath: item["imagePath"],
                      name: item["name"],
                      addOns: item["addOns"],
                      price: item["price"],
                      quantity: item["quantity"],
                      onIncrease: () => viewModel.increaseQuantity(index),
                      onDecrease: () => viewModel.decreaseQuantity(index),
                      onRemove: () => viewModel.removeItem(index),
                    );
                  }).toList(),
                ),
              32.verticalSpace,

              // Promo Code Section
              Row(
                children: [
                  // Expanded(
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       hintText: "Promo Code",
                  //       hintStyle: AppTextStyles.xsRegular.copyWith(
                  //         color: AppColors.gray500,
                  //       ),
                  //       filled: true,
                  //       fillColor: AppColors.gray50,
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(12.r),
                  //         borderSide: BorderSide.none,
                  //       ),
                  //       contentPadding: EdgeInsets.symmetric(
                  //         horizontal: 16.w,
                  //         vertical: 14.h,
                  //       ),
                  //     ),
                  //     style: AppTextStyles.xsRegular,
                  //     onSubmitted: (value) {
                  //       viewModel.applyPromoCode(value);
                  //     },
                  //   ),
                  // ),
                  Expanded(
                      child: CustomTextField(
                    hintText: "Promo Code",
                    controller: viewModel.promoCodeController,
                    onFieldSubmitted: (value) {
                      viewModel.applyPromoCode(value);
                    },
                  )),
                  16.horizontalSpace,
                  SizedBox(
                    width: 100.w,
                    child: CustomElevatedButton(
                        backgroundColor: AppColors.red90,
                        text: "Apply",
                        onPressed: () {
                          viewModel.applyPromoCode("");
                        }),
                  ),
                ],
              ),
              32.verticalSpace,

              // Summary Section
              _buildSummaryRow(
                  "Subtotal:", "\$${viewModel.subtotal.toStringAsFixed(2)}"),
              8.verticalSpace,
              _buildSummaryRow("Delivery charge:",
                  "\$${viewModel.deliveryCharge.toStringAsFixed(2)}"),
              8.verticalSpace,
              _buildSummaryRow("Tax:", "\$${viewModel.tax.toStringAsFixed(2)}"),
              16.verticalSpace,
              _buildSummaryRow(
                  "TOTAL", "\$${viewModel.total.toStringAsFixed(2)}",
                  isTotal: true),
              32.verticalSpace,

              // Proceed to Checkout Button
              CustomElevatedButton(
                  text: "Proceed to Checkout",
                  onPressed: () {
                    viewModel.proceedToCheckout();
                  }),
              20.verticalSpace, // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build cart item
  Widget _buildCartItem({
    required int index,
    required String imagePath,
    required String name,
    required String addOns,
    required double price,
    required int quantity,
    required VoidCallback onIncrease,
    required VoidCallback onDecrease,
    required VoidCallback onRemove,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppColors.gray10,
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(color: AppColors.gray50),
          boxShadow: [
            BoxShadow(
              color: AppColors.red60.withValues(alpha: 0.3),
              blurRadius: 5.r,
              spreadRadius: 0.r,
              offset: Offset(0, 12.h),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: imagePath,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
              radius: BorderRadius.circular(8.r),
            ),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.xSSemibold.copyWith(
                      color: AppColors.headingColor,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    addOns,
                    style: AppTextStyles.xsRegular2.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: AppTextStyles.lSemibold.copyWith(
                      color: AppColors.red90,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: Icon(
                      Icons.close,
                      color: AppColors.red90,
                      size: 22.sp,
                    ),
                  ),
                ),
                18.verticalSpace,
                Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.red90,
                            width: 1,
                          ),
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Icon(
                          Icons.remove,
                          color: AppColors.red90,
                          size: 20.sp,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    Text(
                      "$quantity",
                      style: AppTextStyles.mMedium,
                    ),
                    8.horizontalSpace,
                    GestureDetector(
                      onTap: onIncrease,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.red90,
                        ),
                        child: Icon(
                          Icons.add,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build summary row
  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTextStyles.mSemibold
              : AppTextStyles.xsRegular.copyWith(
                  color: AppColors.gray500,
                ),
        ),
        Text(
          value,
          style: isTotal
              ? AppTextStyles.mSemibold.copyWith(
                  color: AppColors.red90,
                )
              : AppTextStyles.xsRegular.copyWith(
                  color: AppColors.headingColor,
                ),
        ),
      ],
    );
  }

  @override
  CartViewModel viewModelBuilder(BuildContext context) => CartViewModel();
}
