import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:stacked/stacked.dart';
import 'item_details_viewmodel.dart';

class ItemDetailsView extends StackedView<ItemDetailsViewModel> {
  const ItemDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ItemDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomNavbar(
        title: "Item Details",
        onBackPressed: () {
          viewModel.navigateBack();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Item Image with Favorite Icon
              Center(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomImageView(
                        imagePath: AppImages.burger,
                        height: 200.h,
                        width: 200.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      right: 0.w,
                      child: GestureDetector(
                        onTap: () {
                          viewModel.toggleFavorite();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: viewModel.isFavorite
                                ? Colors.white
                                : AppColors.red90,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4.r,
                                offset: Offset(0, 2.h),
                              ),
                            ],
                          ),
                          child: Icon(
                            viewModel.isFavorite
                                ? Icons.favorite_outlined
                                : Icons.favorite_outlined,
                            color: viewModel.isFavorite
                                ? AppColors.red90
                                : AppColors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              16.verticalSpace,

              // Size Selection
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSizeButton(
                    size: "S",
                    isSelected: viewModel.selectedSize == "S",
                    onTap: () {
                      viewModel.selectSize("S");
                    },
                  ),
                  10.horizontalSpace,
                  _buildSizeButton(
                    size: "M",
                    isSelected: viewModel.selectedSize == "M",
                    onTap: () {
                      viewModel.selectSize("M");
                    },
                  ),
                  10.horizontalSpace,
                  _buildSizeButton(
                    size: "L",
                    isSelected: viewModel.selectedSize == "L",
                    onTap: () {
                      viewModel.selectSize("L");
                    },
                  ),
                ],
              ),
              24.verticalSpace,

              // Item Details
              Text(
                "Margherita Pizza",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.headingColor,
                ),
              ),
              8.verticalSpace,
              Text(
                "A timeless classic! Enjoy the perfect blend of fresh mozzarella, tangy tomato sauce, and aromatic basil on a crispy, hand-tossed crust.",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.gray500,
                  height: 1.5,
                ),
              ),
              16.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.star_rate_rounded,
                    color: Colors.yellow[700],
                    size: 25.sp,
                  ),
                  4.horizontalSpace,
                  Text(
                    "4.1 Rating",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.headingColor,
                    ),
                  ),
                  8.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      viewModel.toggleReviews();
                    },
                    child: Text(
                      "See Review",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.red90,
                        decorationColor: AppColors.red90,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              24.verticalSpace,

              // Add-Ons Section
              Text(
                "Choice of Add On",
                style: AppTextStyles.lSemibold.copyWith(
                  color: AppColors.headingColor,
                ),
              ),
              16.verticalSpace,
              _buildAddOnItem(
                name: "Mozzarella",
                price: 1.50,
                isSelected: viewModel.selectedAddOns.contains("Mozzarella"),
                onTap: () {
                  viewModel.toggleAddOn("Mozzarella");
                },
                imagePath: AppImages.mozarella,
              ),
              16.verticalSpace,
              _buildAddOnItem(
                name: "Jalapeños",
                price: 1.00,
                isSelected: viewModel.selectedAddOns.contains("Jalapeños"),
                onTap: () {
                  viewModel.toggleAddOn("Jalapeños");
                },
                imagePath: AppImages.jalapenos,
              ),
              16.verticalSpace,
              _buildAddOnItem(
                name: "Pesto Sauce",
                price: 2.00,
                isSelected: viewModel.selectedAddOns.contains("Pesto Sauce"),
                onTap: () {
                  viewModel.toggleAddOn("Pesto Sauce");
                },
                imagePath: AppImages.pestoSauce,
              ),
              16.verticalSpace,
              _buildAddOnItem(
                name: "Pepperoni",
                price: 1.00,
                isSelected: viewModel.selectedAddOns.contains("Pepperoni"),
                onTap: () {
                  viewModel.toggleAddOn("Pepperoni");
                },
                imagePath: AppImages.peparoni,
              ),
              32.verticalSpace,

              // Reviews Section
              if (viewModel.showReviews) ...[
                Text(
                  "Reviews",
                  style: AppTextStyles.lSemibold.copyWith(
                    color: AppColors.headingColor,
                  ),
                ),
                16.verticalSpace,
                ...viewModel.reviews.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> review = entry.value;
                  return _buildReviewItem(
                    index: index,
                    userName: review["userName"],
                    timestamp: review["timestamp"],
                    rating: review["rating"],
                    comment: review["comment"],
                    likes: review["likes"],
                    images: List<String>.from(review["images"]),
                    hasLiked: viewModel.userLikedReviews.contains(index),
                    onLikeToggle: () {
                      viewModel.toggleLike(index);
                    },
                  );
                }).toList(),
                32.verticalSpace,
              ],

              // Add to Cart Button
              CustomElevatedButton(text: "Add to Cart", onPressed: () {}),
              20.verticalSpace, // Bottom padding
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build size selection buttons
  Widget _buildSizeButton({
    required String size,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red90 : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected ? AppColors.red90 : AppColors.gray500,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.gray500,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build add-on items
  Widget _buildAddOnItem({
    required String name,
    required double price,
    required bool isSelected,
    required VoidCallback onTap,
    required String imagePath,
  }) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: 40.w,
          height: 40.h,
          fit: BoxFit.cover,
        ),
        16.horizontalSpace,
        Expanded(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.headingColor,
            ),
          ),
        ),
        Text(
          "+\$${price.toStringAsFixed(2)}",
          style: AppTextStyles.xsMedium.copyWith(
            color: AppColors.headingColor,
          ),
        ),
        16.horizontalSpace,
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColors.red90 : Colors.white,
              border: Border.all(
                color: isSelected ? AppColors.red90 : AppColors.gray500,
                width: 2.w,
              ),
            ),
            child: isSelected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.sp,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // Helper method to build review items
  Widget _buildReviewItem({
    required int index,
    required String userName,
    required String timestamp,
    required int rating,
    required String comment,
    required int likes,
    required List<String> images,
    required bool hasLiked,
    required VoidCallback onLikeToggle,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomImageView(
                imagePath: AppImages.person,
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(20.r),
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      userName,
                      style: AppTextStyles.xsMedium.copyWith(
                        color: AppColors.headingColor,
                      ),
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: AppColors.ratingYellowColor,
                        size: 20.sp,
                      );
                    }),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                timestamp,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.gray500,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            comment,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.gray500,
              height: 1.5,
            ),
          ),
          8.verticalSpace,
          GestureDetector(
            onTap: onLikeToggle,
            child: Row(
              children: [
                Icon(
                  hasLiked ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.red90,
                  size: 20.sp,
                ),
                4.horizontalSpace,
                Text(
                  "$likes likes",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: hasLiked ? AppColors.red90 : AppColors.gray500,
                  ),
                ),
              ],
            ),
          ),
          if (images.isNotEmpty) ...[
            12.verticalSpace,
            SizedBox(
              height: 80.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                separatorBuilder: (context, index) => 8.horizontalSpace,
                itemBuilder: (context, index) {
                  return CustomImageView(
                    imagePath: images[index],
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                    radius: BorderRadius.circular(8.r),
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  ItemDetailsViewModel viewModelBuilder(BuildContext context) =>
      ItemDetailsViewModel();
}
