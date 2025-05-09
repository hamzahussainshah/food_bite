import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_navbar.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';
import '../../common/text_styles.dart';
import 'menu_viewmodel.dart';

// Assuming BestSellerItemCard is defined elsewhere
import 'package:food_bite/ui/widgets/best_seller_item_card.dart'; // Replace with your actual path

class MenuView extends StackedView<MenuViewModel> {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MenuViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Menu',
        onBackPressed: () {
          viewModel.navigateBack();
        },
      ),
      body: viewModel.isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: AppColors.red90,
            ))
          : ModalProgressHUD(
              color: Colors.black54,
              opacity: 1,
              progressIndicator: LoadingAnimationWidget.beat(
                size: 40,
                color: AppColors.red90,
              ),
              inAsyncCall: viewModel.isBusy,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Categories Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.headingColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle "See all" tap
                              print("See all categories tapped");
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.red90,
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      SizedBox(
                        height: 110.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildCategoryCard(
                              title: "Appetizers",
                              imagePath: AppImages.appetizers,
                              isSelected: viewModel.isSelected == "Appetizers",
                              onTap: () {
                                viewModel.changeTab("Appetizers");
                              },
                            ),
                            10.horizontalSpace,
                            _buildCategoryCard(
                              title: "Main Course",
                              imagePath: AppImages.mainCourse,
                              isSelected: viewModel.isSelected == "main course",
                              onTap: () {
                                viewModel.changeTab("main course");
                              },
                            ),
                            10.horizontalSpace,
                            _buildCategoryCard(
                              title: "Desserts",
                              imagePath: AppImages.deserts,
                              isSelected: viewModel.isSelected == "Desserts",
                              onTap: () {
                                viewModel.changeTab("Desserts");
                              },
                            ),
                          ],
                        ),
                      ),
                      24.verticalSpace,

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
                                  side: BorderSide(
                                    color: AppColors.red90,
                                    width: 1.5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
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

                      24.verticalSpace,

                      // Bestsellers Section
                      Text(
                        "Bestsellers",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.headingColor,
                        ),
                      ),
                      16.verticalSpace,
                      viewModel.filteredMenuItems.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 50.h),
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
                                    viewModel.navigateToItemDetailsView(item);
                                  },
                                );
                              }).toList(),
                            ),

                      24.verticalSpace,

                      // Recommended Items Section
                      // Text(
                      //   "Recommended Items",
                      //   style: TextStyle(
                      //     fontSize: 18.sp,
                      //     fontWeight: FontWeight.w600,
                      //     color: AppColors.headingColor,
                      //   ),
                      // ),
                      // 16.verticalSpace,
                      // GridView.count(
                      //   crossAxisCount: 2,
                      //   shrinkWrap: true,
                      //   physics: ScrollPhysics(
                      //     parent: NeverScrollableScrollPhysics(),
                      //   ),
                      //   crossAxisSpacing: 16.w,
                      //   mainAxisSpacing: 16.h,
                      //   childAspectRatio: 0.63,
                      //   children: [
                      //     BestSellerItemCard(
                      //       name: "Margherita Pizza",
                      //       description:
                      //           "Classic Italian pizza with fresh mozzarella.",
                      //       price: 12.99,
                      //       rating: 4.1,
                      //       imagePath: AppImages.burger,
                      //       onAdd: () {
                      //         print("Add Margherita Pizza to cart");
                      //       },
                      //     ),
                      //     BestSellerItemCard(
                      //       name: "Margherita Pizza",
                      //       description:
                      //           "Classic Italian pizza with fresh mozzarella.",
                      //       price: 12.99,
                      //       rating: 4.1,
                      //       imagePath: AppImages.burger,
                      //       onAdd: () {
                      //         print("Add Margherita Pizza to cart");
                      //       },
                      //     ),
                      //   ],
                      // ),
                      // 20.verticalSpace, // Bottom padding
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // Helper method to build category cards
  Widget _buildCategoryCard({
    required String title,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 105.w,
        // padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red90 : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4.r,
              offset: Offset(0, 2.h),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(5.r),
              width: 95.w,
              height: 66.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CustomImageView(
                imagePath: imagePath,
                width: 75.w,
              ),
            ),
            8.verticalSpace,
            Text(
              title,
              style: AppTextStyles.xsSemibold2.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : AppColors.headingColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build tabs
  Widget _buildTab({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.red90 : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.gray500,
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(MenuViewModel viewModel) {
    viewModel.fetchMenu();

    super.onViewModelReady(viewModel);
  }

  @override
  MenuViewModel viewModelBuilder(BuildContext context) => MenuViewModel();
}
