import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:food_bite/ui/widgets/order_card.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../common/text_styles.dart';
import '../../widgets/order_rating_card.dart';
import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> with RouteAware{
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryViewModel viewModel,
    Widget? child,
  ) {
    return ModalProgressHUD(
      inAsyncCall: viewModel.isBusy,
      color: Colors.black54,
      opacity: 1,
      progressIndicator: LoadingAnimationWidget.beat(
        size: 40,
        color: AppColors.red90,
      ),
      child: ProviderScope(
        child: Consumer(
          builder: (context, ref, child) {
            return viewModel.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.red90,
                    ),
                  )
                : DefaultTabController(
                    length: 2, // Two tabs: Ongoing and History
                    initialIndex: viewModel.tabIndex,
                    child: Scaffold(
                      backgroundColor: AppColors.white,
                      body: SafeArea(
                        child: Column(
                          children: [
                            // Search bar
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 25.w,
                                vertical: 15.h,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 10.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.gray10,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      color: AppColors.gray50, width: 1),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      color: AppColors.gray500,
                                      size: 20.sp,
                                    ),
                                    10.horizontalSpace,
                                    Expanded(
                                      child: Text(
                                        'Search on Foobite',
                                        style: AppTextStyles.xsMedium.copyWith(
                                          color: AppColors.gray500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Tabs
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: TabBar(
                                onTap: (index) {
                                  viewModel.setTabIndex(index);
                                },
                                labelColor: AppColors.headingColor,
                                unselectedLabelColor: AppColors.gray500,
                                labelStyle: AppTextStyles.regular.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                indicatorColor: AppColors.red90,
                                indicatorWeight: 2.h,
                                indicatorSize: TabBarIndicatorSize.tab,
                                tabs: [
                                  Tab(
                                    child: SizedBox(
                                      width: (screenWidth(context) / 2).w - 35.w,
                                      child: const Center(child: Text('Ongoing')),
                                    ),
                                  ),
                                  Tab(
                                    child: SizedBox(
                                      width: (screenWidth(context) / 2).w - 35.w,
                                      child: const Center(child: Text('History')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            20.verticalSpace,
                            // Tab content
                            Expanded(
                              child: TabBarView(
                                children: [
                                  // Ongoing Orders
                                  viewModel.ongoingOrders.isEmpty
                                      ? Center(
                                          child: Text(
                                            'No ongoing orders',
                                            style: AppTextStyles.regular.copyWith(
                                              color: AppColors.gray500,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          itemCount:
                                              viewModel.ongoingOrders.length,
                                          itemBuilder: (context, index) {
                                            final order =
                                                viewModel.ongoingOrders[index];
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15.h),
                                              child: OrderCard(
                                                order: order,
                                                orderId: order.id,
                                                onTrackOrder: () {
                                                  viewModel
                                                      .navigateToTrackOrder();
                                                },
                                                onCancelOrder: () {
                                                  viewModel.cancelOrder(order.id);
                                                  // if (viewModel.ongoingOrders.isEmpty) {
                                                  //   viewModel
                                                  //       .navigateToRateDriverView();
                                                  // }
                                                },
                                                screenWidth: screenWidth(context),
                                                viewModel: viewModel,
                                              ),
                                            );
                                          },
                                        ),
                                  // History Orders
                                  viewModel.historyOrders.isEmpty
                                      ? Center(
                                          child: Text(
                                            'No order history',
                                            style: AppTextStyles.regular.copyWith(
                                              color: AppColors.gray500,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          itemCount:
                                              viewModel.historyOrders.length,
                                          itemBuilder: (context, index) {
                                            final order =
                                                viewModel.historyOrders[index];
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15.h),
                                              child: OrderRatingCard(
                                                order: order,
                                                orderId: order.id,
                                                onReOrder: () {
                                                  viewModel.navigateToMenuView();
                                                },
                                                screenWidth: screenWidth(context),
                                                viewModel: viewModel,
                                              ),
                                            );
                                          },
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }



  @override
  void onViewModelReady(HistoryViewModel viewModel) {
    viewModel.getUserOrders();
    super.onViewModelReady(viewModel);
  }

  @override
  HistoryViewModel viewModelBuilder(BuildContext context) {
    return HistoryViewModel();
  }
}
