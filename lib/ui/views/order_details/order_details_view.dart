import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../widgets/dashed_painter_lines.dart';
import 'order_details_viewmodel.dart';

class OrderDetailsView extends StackedView<OrderDetailsViewModel> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OrderDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: "Order Details"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Order number and item name
                    Row(
                      children: [
                        CustomImageView(
                          imagePath: AppImages.burger,
                          width: 60,
                          fit: BoxFit.fitWidth,
                        ),
                        15.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order #252889',
                                style: AppTextStyles.xsRegular2.copyWith(
                                  color: AppColors.gray500,
                                ),
                              ),
                              Text(
                                'Margherita Pizza',
                                style: AppTextStyles.lSemibold.copyWith(
                                  color: AppColors.headingColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                          color: AppColors.gray10,
                          border: Border.all(
                            color: AppColors.gray50,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18.r),
                            topRight: Radius.circular(18.r),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'LOCATION',
                              style: AppTextStyles.regular.copyWith(
                                  color: AppColors.headingColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            15.verticalSpace,
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: AppColors.red90,
                                    ),
                                    const SizedBox(height: 5),
                                    CustomPaint(
                                      size: const Size(2, 40),
                                      painter: DashedLinePainter(),
                                    ),
                                    const SizedBox(height: 5),
                                    Icon(
                                      Icons.location_on_rounded,
                                      color: AppColors.red90,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Foobite – 62-A Abdali Road',
                                        style: AppTextStyles.xsMedium.copyWith(
                                          color: AppColors.headingColor,
                                        ),
                                      ),
                                      Text(
                                        'Restaurant • 13:00 PM',
                                        style: AppTextStyles.xsMedium2.copyWith(
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'You – #6 Ground Islamabad Pakistan',
                                        style: AppTextStyles.xsMedium.copyWith(
                                          color: AppColors.headingColor,
                                        ),
                                      ),
                                      Text(
                                        'Home • 13:30 PM',
                                        style: AppTextStyles.xsMedium2.copyWith(
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: AppColors.gray10,
                        border: Border.all(
                          color: AppColors.gray50,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1x Margherita Pizza',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                              Text(
                                '\$33.60',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.red90),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1x Margherita Pizza',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                              Text(
                                '\$33.60',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.red90),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Payment method
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: AppColors.gray10,
                        border: Border.all(
                          color: AppColors.gray50,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PAID',
                              style: AppTextStyles.regular.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.headingColor),
                            ),
                            10.verticalSpace,
                            Row(
                              children: [
                                const Icon(
                                  Icons.credit_card,
                                  color: AppColors.green,
                                  size: 24,
                                ),
                                10.horizontalSpace,
                                Text(
                                  'Credit Card',
                                  style: AppTextStyles.xsMedium
                                      .copyWith(color: AppColors.headingColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Cost breakdown
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: AppColors.gray10,
                        border: Border.all(
                          color: AppColors.gray50,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SUBTOTAL:',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                              Text(
                                '\$27.30',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                            ],
                          ),
                          6.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery charge:',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                              Text(
                                '\$5.30',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                            ],
                          ),
                          6.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tax:',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                              Text(
                                '\$1.00',
                                style: AppTextStyles.xsMedium
                                    .copyWith(color: AppColors.headingColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                          color: AppColors.gray10,
                          border: Border.all(
                            color: AppColors.gray50,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(18.r),
                            bottomRight: Radius.circular(18.r),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOTAL',
                            style: AppTextStyles.regular.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.headingColor),
                          ),
                          Text(
                            '\$33.60',
                            style: AppTextStyles.regular.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.red90),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Download Invoice button
                    CustomElevatedButton(
                        text: "Download Invoice",
                        onPressed: () {
                          viewModel.downloadInvoice();
                        }),
                    20.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  OrderDetailsViewModel viewModelBuilder(BuildContext context) =>
      OrderDetailsViewModel();
}
