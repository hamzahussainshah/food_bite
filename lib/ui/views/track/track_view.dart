import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:stacked/stacked.dart';

import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_image_widget.dart';
import '../../widgets/dashed_painter_lines.dart';
import 'track_viewmodel.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class TrackView extends StackedView<TrackViewModel> {
  const TrackView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TrackViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          // Map background
          Positioned.fill(
            child: CustomImageView(
              imagePath: AppImages.mapLocation,
              fit: BoxFit.cover,
            ),
          ),

          // Delivery person card
          Positioned(
            bottom: 20,
            left: 25,
            right: 25,
            child: Column(
              children: [
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                color: AppColors.red90,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: CustomImageView(
                                imagePath: AppImages.takeawayBag,
                                height: 25,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Order',
                                    style: AppTextStyles.regular.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.headingColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Coming within 30 minutes',
                                    style: AppTextStyles.xsMedium.copyWith(
                                      color: AppColors.gray500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: AppColors.gray100,
                          thickness: 1,
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Margherita Pizza',
                                  style: AppTextStyles.xsMedium2.copyWith(
                                    color: AppColors.headingColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                5.verticalSpace,
                                Row(
                                  children: [
                                    Text(
                                      '\$33.60 ',
                                      style: AppTextStyles.xsMedium2.copyWith(
                                        color: AppColors.red90,
                                      ),
                                    ),
                                    Text(
                                      '• 2 items • Credit Card',
                                      style: AppTextStyles.xsMedium2.copyWith(
                                        color: AppColors.gray400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            SizedBox(
                              width: 80.w,
                              child: CustomElevatedButton(
                                text: 'Detail',
                                onPressed: () {
                                  viewModel.navigateToDetails();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                15.verticalSpace,
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.r),
                    child: Column(
                      children: [
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
                                )
                              ],
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Foobite – 62-A Abdali Road',
                                    style: AppTextStyles.xsMedium.copyWith(
                                      color: AppColors.headingColor,
                                    ),
                                  ),
                                  Text(
                                    'Restaurant • 13:00 PM',
                                    style: AppTextStyles.xsMedium2
                                        .copyWith(color: AppColors.gray500),
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
                                    style: AppTextStyles.xsMedium2
                                        .copyWith(color: AppColors.gray500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        10.verticalSpace,
                        Row(
                          children: [
                            CustomImageView(
                              imagePath: AppImages.profile,
                              height: 45.h,
                              width: 45.w,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(15.r),
                            ),
                            15.horizontalSpace,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Philippe Troussier',
                                    style: AppTextStyles.xsMedium.copyWith(
                                      color: AppColors.headingColor,
                                    ),
                                  ),
                                  Text(
                                    'Delivery',
                                    style: AppTextStyles.xsMedium2
                                        .copyWith(color: AppColors.gray500),
                                  ),
                                  Text(
                                    '03130000112',
                                    style: AppTextStyles.xsMedium2
                                        .copyWith(color: AppColors.gray500),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                buildContactContainer(
                                  icon: CupertinoIcons.phone_fill,
                                  color: AppColors.green,
                                  onPressed: () {
                                    viewModel.callDeliveryPerson();
                                  },
                                ),
                                10.horizontalSpace,
                                buildContactContainer(
                                  icon: CupertinoIcons.chat_bubble_text_fill,
                                  color: AppColors.red60,
                                  onPressed: () {
                                    viewModel.chatWithDeliveryPerson();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContactContainer(
      {required IconData icon,
      required Color color,
      required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Icon(
            icon,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  @override
  TrackViewModel viewModelBuilder(BuildContext context) => TrackViewModel();
}
