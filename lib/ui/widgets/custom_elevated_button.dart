import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../common/app_colors.dart';
import '../common/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.elevation,
    this.minimumSize,
    this.iconPath,
    this.isDisabled = false,
    this.isBgColor = true,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
    this.buttonTextStyle,
  });

  final TextStyle? buttonTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final bool isDisabled;
  final bool isBgColor;
  final String? iconPath;
  final String text;
  final Size? minimumSize;
  final double? elevation;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // Determine the background color or gradient
    final buttonColor = isDisabled
        ? AppColors.gray500
        : backgroundColor ?? (isBgColor ? null : AppColors.white);

    final buttonGradient = (isBgColor && backgroundColor == null)
        ? isDisabled
            ? LinearGradient(
                colors: [AppColors.gray200, AppColors.gray400],
                stops: [0.0, 1.0],
              )
            : const LinearGradient(
                colors: [AppColors.red90, AppColors.red60],
                stops: [0.0, 1.0],
              )
        : null;

    // Text style based on the original logic
    final textStyle = buttonTextStyle ??
        AppTextStyles.mediumBold.copyWith(
          color: isDisabled
              ? AppColors.gray500
              : isBgColor
                  ? textColor ?? AppColors.white
                  : textColor ?? AppColors.red90,
        );

    // Use the original minimumSize or default to full width and 50.h height
    final effectiveMinimumSize = minimumSize ?? Size(double.infinity, 50.h);

    // Define the border radius
    final borderRadius = BorderRadius.circular(15.r);

    return SizedBox(
      width: effectiveMinimumSize.width,
      height: effectiveMinimumSize.height,
      child: GestureDetector(
        onTap: isDisabled ? null : onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: buttonColor,
            gradient: buttonGradient,
            borderRadius: borderRadius,
            border: isDisabled
                ? null
                : Border.all(color: borderColor ?? Colors.transparent),
            boxShadow: elevation != null
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: elevation!,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (iconPath != null) ...[
                  SvgPicture.asset(
                    iconPath!,
                    height: 20.h,
                    width: 20.w,
                  ),
                  8.horizontalSpace,
                ],
                Text(
                  text,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
