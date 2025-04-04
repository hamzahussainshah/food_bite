import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final TextStyle? titleStyle;
  final Color? backgroundColor;
  final Color? backButtonColor;
  final Color? backButtonBackgroundColor;
  final IconData? backButtonIcon;
  final double? elevation;
  final BorderRadius? borderRadius;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.titleStyle,
    this.backgroundColor,
    this.backButtonColor,
    this.backButtonBackgroundColor,
    this.backButtonIcon,
    this.elevation,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.white,
      elevation: elevation ?? 0,
      centerTitle: true,
      title: Text(
        title,
        style: titleStyle ??
            TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.headingColor,
            ),
      ),
      leading: onBackPressed != null
          ? Padding(
              padding: EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h),
              child: GestureDetector(
                onTap: onBackPressed,
                child: Center(
                  child: Icon(
                    backButtonIcon ?? Icons.arrow_back_ios_new,
                    color: backButtonColor ?? AppColors.red90,
                  ),
                ),
              ),
            )
          : null,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              backgroundColor?.withOpacity(0.9) ??
                  AppColors.white.withOpacity(0.9),
              backgroundColor ?? AppColors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
