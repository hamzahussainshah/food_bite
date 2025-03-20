import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 35.w,
            vertical: 24.0.h,
          ),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: viewModel.pageController,
                  onPageChanged: viewModel
                      .setCurrentPage, // Update currentPage on page change
                  children: [
                    _buildOnboardingPage(
                      AppImages.welcomeBanner,
                      'Welcome to Foobite!',
                      'Delicious meals, fast & fresh—right at your fingertips!',
                    ),
                    _buildOnboardingPage(
                      AppImages.onBoardingCircleImage,
                      'Explore & Order Easily',
                      'A variety of dishes, made just for you!',
                    ),
                    _buildOnboardingPage(
                      AppImages.onboardingTrack,
                      'Track Your Orders Live',
                      'Stay updated with real-time order tracking!',
                    ),
                    _buildOnboardingPage(
                      AppImages.rewardsImage,
                      'Earn Rewards & Enjoy Discounts',
                      'Loyalty pays off—earn points & save more!',
                    ),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: viewModel.pageController,
                count: 4,
                effect: const ExpandingDotsEffect(
                  activeDotColor: AppColors.red90,
                  dotColor: AppColors.gray50,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 4,
                ),
              ),
              64.verticalSpace,
              if (viewModel.currentPage !=
                  3) // Use currentPage instead of pageController.page
                Row(
                  children: [
                    SizedBox(
                      width: 100.w,
                      child: CustomElevatedButton(
                        onPressed: viewModel.onSkip,
                        text: 'Skip',
                        backgroundColor: AppColors.white,
                        textColor: AppColors.headingColor,
                        isBgColor: false,
                        borderColor: AppColors.white,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 100.w,
                      child: CustomElevatedButton(
                        onPressed: viewModel.onNext,
                        text: 'Next',
                        backgroundColor: AppColors.red90,
                        textColor: AppColors.white,
                        borderColor: AppColors.red90,
                      ),
                    ),
                  ],
                ),
              if (viewModel.currentPage ==
                  3) // Use currentPage instead of pageController.page
                CustomElevatedButton(
                  text: 'Get Started',
                  onPressed: () {
                    viewModel.navigateToSignUpView();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(
    String imagePath,
    String title,
    String description,
  ) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: CustomImageView(
              width: 232.w,
              imagePath: imagePath,
              fit: BoxFit.fitWidth,
            ),
          ),
          70.verticalSpace,
          Text(
            textAlign: TextAlign.center,
            title,
            style: AppTextStyles.xlBold,
          ),
          10.verticalSpace,
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumLight,
          ),
        ],
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) =>
      OnboardingViewModel();
}
