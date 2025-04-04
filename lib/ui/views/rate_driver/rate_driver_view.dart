import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import '../../common/text_styles.dart';
import 'rate_driver_viewmodel.dart';

class RateDriverView extends StackedView<RateDriverViewModel> {
  const RateDriverView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RateDriverViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Rate Driver",
        onBackPressed: () {
          viewModel.back();
        },
      ),
      backgroundColor:
          Colors.white, // Match the background color from the image
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      // Driver profile
                      Center(
                        child: Column(
                          children: [
                            // Driver image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CustomImageView(
                                imagePath: AppImages.profile,
                                width: 100,
                                height: 100,
                                radius: BorderRadius.circular(15.r),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Driver name
                            Text(
                              'Philippe Troussier',
                              style: AppTextStyles.mMedium.copyWith(
                                color: AppColors.headingColor,
                              ),
                            ),
                            20.verticalSpace,
                            // Rating section
                            Text(
                              'Your Ratings',
                              style: AppTextStyles.mMedium.copyWith(
                                color: AppColors.headingColor,
                              ),
                            ),
                            10.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  initialRating: viewModel.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 30,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    viewModel.setRating(rating);
                                  },
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '${viewModel.rating} stars',
                                  style: AppTextStyles.xsMedium.copyWith(
                                    color: AppColors.gray500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Feedback buttons
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: viewModel.feedbackOptions.map((option) {
                          final isSelected =
                              viewModel.selectedFeedbacks.contains(option);
                          return GestureDetector(
                            onTap: () {
                              viewModel.toggleFeedback(option);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.red : Colors.white,
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                option,
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      20.verticalSpace,
                      Text(
                        'Additional Feedback',
                        style: AppTextStyles.xsMedium.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                      10.verticalSpace,
                      CustomTextField(
                        maxLines: 3,
                        hintText: "Type here...",
                        controller: viewModel.feedbackController,
                      ),
                      20.verticalSpace, // Padding at the bottom of the scrollable content
                    ],
                  ),
                ),
              ),
              // Next button (sticks to the bottom)
              CustomElevatedButton(
                text: "Next",
                onPressed: () {
                  viewModel.navigateToRateYourFoodView();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  RateDriverViewModel viewModelBuilder(BuildContext context) =>
      RateDriverViewModel();
}
