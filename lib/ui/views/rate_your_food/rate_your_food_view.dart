import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/show_image.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/custom_text_field.dart';
import 'rate_your_food_viewmodel.dart';

class RateYourFoodView extends StackedView<RateYourFoodViewModel> {
  const RateYourFoodView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RateYourFoodViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Rate Your Food",
        onBackPressed: viewModel.back,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
          child: Column(
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      Center(
                        child: Column(
                          children: [
                            // Food image
                            Container(
                              padding: EdgeInsets.all(15.r),
                              decoration: BoxDecoration(
                                color: AppColors.gray50,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: CustomImageView(
                                imagePath: AppImages.burger,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Food name
                            Text(
                              'Margherita Pizza',
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
                        hintText: "Type here...",
                        controller: viewModel.feedbackController,
                        maxLines: 4,
                      ),

                      20.verticalSpace,
                      // Upload photos section
                      if (viewModel.selectedImage == null)
                        GestureDetector(
                          onTap: () {
                            viewModel.chooseAndSelectPhoto();
                          },
                          child: DottedBorder(
                            color: AppColors.gray500,
                            strokeWidth: 1,
                            dashPattern: const [4, 4], // Dashed pattern
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload,
                                    color: AppColors.gray500,
                                    size: 20.sp,
                                  ),
                                  10.horizontalSpace,
                                  Text(
                                    'Upload photos',
                                    style: AppTextStyles.xsMedium.copyWith(
                                      color: AppColors.gray500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      if (viewModel.selectedImage != null)
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowImage(
                                        imagePath:
                                            viewModel.selectedImage!.path)));
                          },
                          child: Center(
                            child: CustomImageView(
                              file: viewModel.selectedImage!,
                              width: 150,
                              fit: BoxFit.cover,
                              radius: BorderRadius.circular(10.r),
                            ),
                          ),
                        ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
              // Submit button (sticks to the bottom)
              CustomElevatedButton(
                text: "Submit",
                onPressed: () {
                  viewModel.submitRating();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  RateYourFoodViewModel viewModelBuilder(BuildContext context) =>
      RateYourFoodViewModel();
}
