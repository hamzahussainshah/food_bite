import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';

import '../../common/assets.dart';
import '../../widgets/best_seller_item_card.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return viewModel.isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.red90,
            ),
          )
        : Scaffold(
            backgroundColor: AppColors.white,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      12.verticalSpace,
                      SizedBox(
                        height: 48.h,
                        child: SearchBar(
                          leading: Icon(
                            Icons.location_on_rounded,
                            color: AppColors.gray500,
                            size: 20.sp,
                          ),
                          elevation: const WidgetStatePropertyAll(0),
                          backgroundColor:
                              const WidgetStatePropertyAll(AppColors.gray50),
                          hintText: 'Search on Foobite',
                          hintStyle: WidgetStatePropertyAll(
                            AppTextStyles.mediumLight
                                .copyWith(color: AppColors.gray500),
                          ),
                          onChanged: (value) {
                            // viewModel.onSearch(value);
                          },
                        ),
                      ),
                      28.verticalSpace,
                      Text(
                        'Welcome to Foobite!',
                        style: AppTextStyles.xxlBold.copyWith(
                          color: AppColors.headingColor,
                        ),
                      ),
                      16.verticalSpace,
                      SizedBox(
                        height: 150.h,
                        child: PageView(
                          controller: viewModel.pageController,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.red90,
                                    AppColors.red60,
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 14.w, top: 16.h, bottom: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Flash Offer',
                                          style:
                                              AppTextStyles.lSemibold.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          textAlign: TextAlign.left,
                                          'We are here with the\nbest desserts in town.',
                                          style:
                                              AppTextStyles.xsRegular.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1,
                                          ),
                                        ),
                                        12.verticalSpace,
                                        Row(
                                          children: [
                                            Text(
                                              'Order Now',
                                              style: AppTextStyles.xsRegular
                                                  .copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            8.horizontalSpace,
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16.sp,
                                              color: AppColors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  CustomImageView(
                                    imagePath: AppImages.burgerFlashOffer,
                                    height: 120.h,
                                    radius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.r)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.red90,
                                    AppColors.red60,
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 14.w, top: 16.h, bottom: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Flash Offer',
                                          style:
                                              AppTextStyles.lSemibold.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          textAlign: TextAlign.left,
                                          'We are here with the\nbest desserts in town.',
                                          style:
                                              AppTextStyles.xsRegular.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1,
                                          ),
                                        ),
                                        12.verticalSpace,
                                        Row(
                                          children: [
                                            Text(
                                              'Order Now',
                                              style: AppTextStyles.xsRegular
                                                  .copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            8.horizontalSpace,
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16.sp,
                                              color: AppColors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  CustomImageView(
                                    imagePath: AppImages.burgerFlashOffer,
                                    height: 120.h,
                                    radius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.r)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.red90,
                                    AppColors.red60,
                                  ],
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 14.w, top: 16.h, bottom: 16.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Flash Offer',
                                          style:
                                              AppTextStyles.lSemibold.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        4.verticalSpace,
                                        Text(
                                          textAlign: TextAlign.left,
                                          'We are here with the\nbest desserts in town.',
                                          style:
                                              AppTextStyles.xsRegular.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1,
                                          ),
                                        ),
                                        12.verticalSpace,
                                        Row(
                                          children: [
                                            Text(
                                              'Order Now',
                                              style: AppTextStyles.xsRegular
                                                  .copyWith(
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            8.horizontalSpace,
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16.sp,
                                              color: AppColors.white,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  CustomImageView(
                                    imagePath: AppImages.burgerFlashOffer,
                                    height: 120.h,
                                    radius: BorderRadius.only(
                                        bottomRight: Radius.circular(15.r)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      Align(
                        alignment: Alignment.center,
                        child: SmoothPageIndicator(
                          controller: viewModel.pageController,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            activeDotColor: AppColors.red90,
                            dotColor: AppColors.gray200,
                            dotHeight: 8,
                            dotWidth: 8,
                            spacing: 4,
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        textAlign: TextAlign.left,
                        'Quick Actions',
                        style: AppTextStyles.lSemibold.copyWith(
                          color: AppColors.headingColor,
                        ),
                      ),
                      10.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildQuickActionContainer(
                            onTap: viewModel.navigateToMenuView,
                            imagePath: AppImages.orderNow,
                            label: 'Order Now',
                          ),
                          buildQuickActionContainer(
                            onTap: viewModel.navigateToBookTableView,
                            imagePath: AppImages.bookTable,
                            label: 'Book a Table',
                          ),
                          buildQuickActionContainer(
                            onTap: () {},
                            imagePath: AppImages.specialOffers,
                            label: 'Special Offers',
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      Text(
                        'Best Sellers',
                        style: AppTextStyles.lSemibold.copyWith(
                          color: AppColors.headingColor,
                        ),
                      ),
                      10.verticalSpace,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            viewModel.buttonLabels.length,
                            (index) => Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: ElevatedButton(
                                onPressed: () {
                                  viewModel.selectButton(index);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      viewModel.selectedButtonIndex == index
                                          ? AppColors.red90
                                          : Colors.white,
                                  foregroundColor:
                                      viewModel.selectedButtonIndex == index
                                          ? Colors.white
                                          : AppColors.red90,
                                  side: const BorderSide(
                                    color: AppColors.red90,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.r),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.w,
                                    vertical: 8.h,
                                  ),
                                  elevation: 0,
                                ),
                                child: Text(
                                  viewModel.buttonLabels[index],
                                  style: AppTextStyles.xsSemibold2.copyWith(
                                    color:
                                        viewModel.selectedButtonIndex == index
                                            ? Colors.white
                                            : AppColors.red90,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.verticalSpace,
                      // Add Best Seller Item Cards with filtered items
                      viewModel.filteredMenuItems.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 20.h),
                                child: Text(
                                  "No items available in this category",
                                  style: AppTextStyles.mRegular.copyWith(
                                    color: AppColors.gray500,
                                  ),
                                ),
                              ),
                            )
                          : GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                              childAspectRatio: 0.63,
                              children: viewModel.filteredMenuItems.map((item) {
                                return BestSellerItemCard(
                                  name: item.name.capitalize!,
                                  description: item.description,
                                  price: item.price.toDouble(),
                                  isUrl: true,
                                  rating:
                                      4.0, // Optional: add rating in model if needed
                                  imagePath: item.images.isNotEmpty
                                      ? item.images.first
                                      : AppImages.burger,
                                  onAdd: () {
                                    viewModel.addItemToCart(item);
                                  },
                                  onTap: () {
                                    viewModel.navigateToDetailsView(item);
                                  },
                                );
                              }).toList(),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget buildQuickActionContainer({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 110.w,
        height: 110.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray50,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(18.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.red60.withValues(alpha: 0.3),
              blurRadius: 8.r,
              spreadRadius: 0.r,
              offset: Offset(0, 18.h),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: imagePath,
              height: 50.h,
              width: 50.w,
              fit: BoxFit.cover,
            ),
            6.verticalSpace,
            Text(
              label,
              style: AppTextStyles.xsSemibold2.copyWith(
                color: AppColors.headingColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.fetchMenu();
    super.onViewModelReady(viewModel);
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
