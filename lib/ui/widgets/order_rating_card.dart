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

class OrderRatingCard extends StatelessWidget {
  final Order order;
  final HistoryViewModel viewModel;
  final VoidCallback onReOrder;
  final double screenWidth;
  final String orderId;

  const OrderRatingCard({
    Key? key,
    required this.order,
    required this.viewModel,
    required this.onReOrder,
    required this.screenWidth,
    required this.orderId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only show the card if the order status is "Delivered"
    if (order.orderStatus != 'Delivered') {
      return const SizedBox.shrink();
    }

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
        children: [
          // Order Status and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.gray500.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  order.orderStatus,
                  style: AppTextStyles.xsMedium2.copyWith(
                    color: AppColors.gray500,
                  ),
                ),
              ),
              Text(
                DateFormat('EEEE, dd MMMM yyyy').format(order.createdAt),
                style: AppTextStyles.xsMedium2.copyWith(
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          10.verticalSpace,
          Divider(
            color: AppColors.gray50,
            thickness: 1.5,
            height: 20.h,
          ),
          10.verticalSpace,

          // Show all items
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.items.length,
            itemBuilder: (context, index) {
              final item = order.items[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 15.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      url: viewModel.getMenuItemImage(item.menuItem!.id),
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      radius: BorderRadius.circular(10.r),
                    ),
                    15.horizontalSpace,
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ('x${item.quantity}').substring(0, ('x${item.quantity}').length > 10 ? 10 : ('x${item.quantity}').length),
                                style: AppTextStyles.xsMedium.copyWith(
                                  color: AppColors.gray500,
                                ),
                              ),
                              5.verticalSpace,
                              Row(
                                children: [
                                  Text(
                                    '\$${item.price}',
                                    style: AppTextStyles.xsMedium.copyWith(
                                      color: AppColors.red90,
                                    ),
                                  ),
                                  5.horizontalSpace,
                                  Text(
                                    'x${item.quantity}',
                                    style: AppTextStyles.xsMedium.copyWith(
                                      color: AppColors.gray500,
                                    ),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                            ],
                          ),
                          Spacer(),
                          if (item.menuItem!.reviews!.isEmpty)
                            SizedBox(
                              width: (screenWidth / 4).w,
                              child: CustomElevatedButton(
                                text: 'Review',
                                onPressed: () {
                                  viewModel.rateItem(item.menuItem!.id);
                                },
                                isBgColor: true,
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

          10.verticalSpace,
          Divider(
            color: AppColors.gray50,
            thickness: 1,
            height: 20.h,
          ),
          10.verticalSpace,

          // Total Amount and Reorder Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${order.totalAmount}',
                style: AppTextStyles.mSemibold.copyWith(
                  color: AppColors.headingColor,
                ),
              ),
              SizedBox(
                width: (screenWidth / 2).w - 20.w,
                child: CustomElevatedButton(
                  text: 'Reorder',
                  onPressed: onReOrder,
                  isBgColor: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
