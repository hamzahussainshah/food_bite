import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:food_bite/ui/views/history/history_viewmodel.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:intl/intl.dart';

import '../../data_service/data_model/order_model.dart';
import '../common/app_colors.dart';
import '../common/text_styles.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final HistoryViewModel viewModel;
  final VoidCallback onTrackOrder;
  final VoidCallback onCancelOrder;
  final double screenWidth;
  final String orderId;
  final bool isCompleted;

  const OrderCard({
    Key? key,
    required this.order,
    required this.viewModel,
    required this.onTrackOrder,
    required this.onCancelOrder,
    required this.screenWidth,
    required this.orderId,
    this.isCompleted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if order status is "Delivered"; if so, return empty widget
    if (order.orderStatus == 'Delivered') {
      return const SizedBox.shrink();
    }

    final isOngoing = order.orderStatus != 'Delivered';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
                      order.orderStatus,
                      style: AppTextStyles.xsMedium2.copyWith(
                        color: isOngoing ? AppColors.green : AppColors.gray500,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                DateFormat('EEEE, dd MMMM yyyy').format(order.createdAt),
                style: AppTextStyles.xsMedium2.copyWith(
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          5.verticalSpace,
          Divider(
            color: AppColors.gray50,
            thickness: 1.5,
            height: 20.h,
          ),
          5.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              final item = order.items[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      url: viewModel.getMenuItemImage(item.menuItem?.id ?? ''),
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(10.r),
                    ),
                    15.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            viewModel.getMenuItemName(item.menuItem?.id ?? ''),
                            style: AppTextStyles.lSemibold.copyWith(
                              color: AppColors.headingColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          5.verticalSpace,
                          Text(
                            'x${item.quantity}',
                            style: AppTextStyles.xsMedium.copyWith(
                              color: AppColors.gray500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${order.totalAmount}',
                style: AppTextStyles.mSemibold.copyWith(
                  color: AppColors.headingColor,
                ),
              ),
              Text(
                '${order.items.length} items',
                style: AppTextStyles.xsMedium.copyWith(
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: (screenWidth / 2).w - 60.w,
                child: CustomElevatedButton(
                  text: isCompleted ? "Re-Order" : 'Track Order',
                  onPressed: onTrackOrder,
                  isBgColor: true,
                ),
              ),
              10.horizontalSpace,
              SizedBox(
                width: (screenWidth / 2).w - 60.w,
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