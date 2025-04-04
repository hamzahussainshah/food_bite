import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import 'payment_methods_viewmodel.dart';

class PaymentMethodsView extends StackedView<PaymentMethodsViewModel> {
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PaymentMethodsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 70.h,
              padding: EdgeInsets.all(15.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: AppColors.red10,
              ),
              child: const Icon(
                CupertinoIcons.creditcard_fill,
                color: AppColors.red90,
                size: 40,
              ),
            ),
            50.verticalSpace,
            Text(
              'You service feedback success',
              style: AppTextStyles.mMedium.copyWith(
                color: AppColors.headingColor,
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'It looks like you don’t have a credit or debit card yet. Please add your cards.',
                textAlign: TextAlign.center,
                style: AppTextStyles.xsMedium2.copyWith(
                  color: AppColors.gray500,
                ),
              ),
            ),
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomElevatedButton(
                  text: 'Add Cards',
                  onPressed: () {
                    viewModel.navigateToAddPaymentCardView();
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  PaymentMethodsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PaymentMethodsViewModel();
}
