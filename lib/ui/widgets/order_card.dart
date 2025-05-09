import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';

import '../common/app_colors.dart';
import '../common/text_styles.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onTrackOrder;
  final VoidCallback onCancelOrder;
  final double screenWidth;
  final int orderId; // Add orderId parameter
  final bool isCompleted;

  const OrderCard({
    Key? key,
    required this.order,
    required this.onTrackOrder,
    required this.onCancelOrder,
    required this.screenWidth,
    required this.orderId, // Add orderId to constructor
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isOngoing = order['status'] == 'Ongoing';

    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColors.gray10,
        border: Border.all(
          color: AppColors.gray50,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(18.r),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Food',
                    style: AppTextStyles.xsMedium2.copyWith(
                      color: AppColors.gray500,
                    ),
                  ),
                  5.horizontalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: isOngoing
                          ? AppColors.green.withOpacity(0.1)
                          : AppColors.gray500.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      order['status'],
                      style: AppTextStyles.xsMedium2.copyWith(
                        color: isOngoing ? AppColors.green : AppColors.gray500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                order['date'],
                style: AppTextStyles.xsMedium2.copyWith(
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Divider(
            color: AppColors.gray50,
            thickness: 1,
            height: 20.h,
          ),
          16.verticalSpace,
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.burger,
                width: 60.w,
                fit: BoxFit.fitWidth,
              ),
              15.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.verticalSpace,
                    Text(
                      order['name'],
                      style: AppTextStyles.lSemibold.copyWith(
                        color: AppColors.headingColor,
                      ),
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          '\$${order['price']} ',
                          style: AppTextStyles.xsMedium.copyWith(
                            color: AppColors.red90,
                          ),
                        ),
                        Text(
                          '• ${order['items']} items',
                          style: AppTextStyles.xsMedium.copyWith(
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
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: (screenWidth / 2).w - 50.w,
                child: CustomElevatedButton(
                  text: isCompleted ? "Re-Order" : 'Track Order',
                  onPressed: onTrackOrder,
                  isBgColor: true,
                ),
              ),
              15.horizontalSpace,
              SizedBox(
                width: (screenWidth / 2).w - 50.w,
                child: CustomElevatedButton(
                  text: isCompleted ? "Rate" : "Cancel",
                  onPressed: onCancelOrder,
                  backgroundColor: AppColors.gray150,
                  textColor: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
