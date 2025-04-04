import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensures the background is white
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AppImages.splashScreen),
          fit: BoxFit.cover,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: CustomImageView(
              //     imagePath: AppImages.blurEffect1st,
              //     // height: 120.h,
              //   ),
              // ),
              CustomImageView(
                imagePath: AppImages.foodBiteLogo,
                height: 60.h,
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: CustomImageView(
              //     imagePath: AppImages.blurEffect2nd,
              //     // height: 120.h,
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: CustomImageView(
              //     imagePath: AppImages.blurEffect3rd,
              //     // height: 120.h,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
