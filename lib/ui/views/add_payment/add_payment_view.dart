import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_text_field.dart';
import 'add_payment_viewmodel.dart';

class AddPaymentView extends StackedView<AddPaymentViewModel> {
  const AddPaymentView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddPaymentViewModel viewModel,
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
          "Payment Methods",
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
              // Add Card Section
              Text(
                "Add Card",
                style: AppTextStyles.lSemibold,
              ),
              16.verticalSpace,
              CustomTextField(
                hintText: "Cardholder Name",
                controller: viewModel.cardholderNameController,
              ),
              16.verticalSpace,
              CustomTextField(
                hintText: "Card Number",
                controller: viewModel.cardNumberController,
                keyboardType: TextInputType.number,
                prefixIcon: Icon(
                  Icons.credit_card,
                  color: AppColors.gray500,
                  size: 20.sp,
                ),
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: AppColors.gray500,
                  size: 20.sp,
                ),
              ),
              16.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: "MM/YY",
                      controller: viewModel.expiryDateController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: CustomTextField(
                      hintText: "CVC",
                      controller: viewModel.cvcController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
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

  @override
  AddPaymentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AddPaymentViewModel();
}
