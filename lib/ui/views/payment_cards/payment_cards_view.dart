import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import '../../widgets/custom_navbar.dart';
import 'payment_cards_viewmodel.dart';

class PaymentCardsView extends StackedView<PaymentCardsViewModel> {
  const PaymentCardsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentCardsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Payment Methods",
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
              Spacer(),
              // Credit Cards section
              Text(
                "Credit Cards",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              20.verticalSpace,

              // Payment methods list
              _buildPaymentMethodCard(
                imagePath: AppImages.visa,
                title: "Visa",
                subtitle: "Enter information on the card",
                onTap: () {},
              ),
              15.verticalSpace,
              _buildPaymentMethodCard(
                imagePath: AppImages.master,
                title: "MasterCard",
                subtitle: "Enter information on the card",
                onTap: () {},
              ),
              15.verticalSpace,
              _buildPaymentMethodCard(
                imagePath: AppImages.paypal,
                title: "Paypal",
                subtitle: "Enter email PayPal",
                onTap: () {},
              ),

              const Spacer(), // Push the button to the bottom

              // Add Cards button
              CustomElevatedButton(
                text: "Add Cards",
                onPressed: () {
                  viewModel.navigateToAddCardView();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build a payment method card
  Widget _buildPaymentMethodCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImageView(
                imagePath: imagePath,
                width: 34.w,
                fit: BoxFit.cover,
              ),
              15.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: AppTextStyles.xsMedium.copyWith(
                          color: AppColors.headingColor,
                        )),
                    5.verticalSpace,
                    Text(subtitle,
                        style: AppTextStyles.xsMedium2.copyWith(
                          color: AppColors.gray500,
                        )),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20.sp,
                color: AppColors.gray500,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PaymentCardsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentCardsViewModel();
}
