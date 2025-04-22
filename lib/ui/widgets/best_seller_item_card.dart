import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';
import '../common/text_styles.dart';
import 'custom_image_widget.dart';

class BestSellerItemCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;
  final double rating;
  final String imagePath;
  final VoidCallback onAdd;
  final VoidCallback? onTap;
  // Optional parameters for customization
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? ratingColor;
  final Color? priceColor;
  final Color? buttonColor;
  final TextStyle? nameStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? priceStyle;
  final TextStyle? ratingStyle;
  final TextStyle? buttonTextStyle;
  final double? buttonHeight;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final bool? isUrl;

  const BestSellerItemCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.onAdd,
    this.width,
    this.imageHeight,
    this.imageWidth,
    this.padding,
    this.backgroundColor,
    this.ratingColor,
    this.priceColor,
    this.buttonColor,
    this.nameStyle,
    this.descriptionStyle,
    this.priceStyle,
    this.ratingStyle,
    this.buttonTextStyle,
    this.buttonHeight,
    this.borderRadius,
    this.boxShadow,
    this.onTap,
    this.isUrl = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 175.w, // Default width if not provided
        padding:
            padding ?? EdgeInsets.all(10.w), // Default padding if not provided
        decoration: BoxDecoration(
          color: backgroundColor ??
              Colors.white, // Default to white if not provided
          borderRadius: borderRadius ??
              BorderRadius.circular(15.r), // Default border radius
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: AppColors.red60.withValues(alpha: 0.2),
                  blurRadius: 10.r,
                  spreadRadius: 2.r,
                  offset: Offset(0, 4.h),
                ),
              ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color:
                      ratingColor ?? Colors.yellow[700], // Default rating color
                  size: 20.sp,
                ),
                4.horizontalSpace,
                Text(
                  rating.toString(),
                  style: ratingStyle ??
                      AppTextStyles.xsSemibold2.copyWith(
                        color: AppColors.headingColor,
                      ),
                ),
              ],
            ),
            8.verticalSpace,
            // Image
            Center(
              child: CustomImageView(
                imagePath: isUrl! ? null : imagePath,
                url: isUrl! ? imagePath : null,
                height: imageHeight ?? 80.h,
                width: imageWidth ?? 100.w,
                fit: BoxFit.cover,
                radius: BorderRadius.circular(10.r),
              ),
            ),
            8.verticalSpace,
            // Name
            Text(
              name,
              style: nameStyle ??
                  AppTextStyles.mediumLight.copyWith(
                    color: AppColors.headingColor,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            4.verticalSpace,
            // Description
            Text(
              description,
              style: descriptionStyle ??
                  AppTextStyles.xsRegular.copyWith(
                    color: AppColors.gray500,
                  ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            8.verticalSpace,
            // Price and Add Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: priceStyle ??
                      AppTextStyles.mediumLight.copyWith(
                        color: priceColor ?? AppColors.red90,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(
                  height: buttonHeight ?? 30.h, // Default button height
                  child: ElevatedButton(
                    onPressed: onAdd,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor ??
                          AppColors.red90, // Default button color
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Add",
                          style: buttonTextStyle ??
                              AppTextStyles.xsSemibold2.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        4.horizontalSpace,
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
