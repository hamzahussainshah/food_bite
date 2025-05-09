import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stacked/stacked.dart';

import 'table_reservation_viewmodel.dart';

class TableReservationView extends StackedView<TableReservationViewModel> {
  const TableReservationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TableReservationViewModel viewModel,
    Widget? child,
  ) {
    return ModalProgressHUD(
      inAsyncCall: viewModel.isBusy,
      color: Colors.black54,
      opacity: 1,
      progressIndicator: LoadingAnimationWidget.beat(
        color: AppColors.red90,
        size: 40,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Table Reservation"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reservation Date
                Text(
                  "Reservation Date",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                8.verticalSpace,
                TextFormField(
                  controller: viewModel.dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Select Date (e.g., 2025-03-20)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: AppColors.red90),
                    ),
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                  onTap: () => viewModel.selectDate(context),
                  validator: (value) => viewModel.validateDate(value),
                ),
                SizedBox(height: 20.h),

                // Reservation Time
                Text(
                  "Reservation Time",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: viewModel.timeController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Select Time (e.g., 18:00)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: AppColors.red90),
                    ),
                    suffixIcon: const Icon(Icons.access_time),
                  ),
                  onTap: () => viewModel.selectTime(context),
                  validator: (value) => viewModel.validateTime(value),
                ),
                20.verticalSpace,
                Text(
                  "Number of Guests",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                8.verticalSpace,
                DropdownButtonFormField<int>(
                  value: viewModel.guestCount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(color: AppColors.red90),
                    ),
                  ),
                  items: List.generate(10, (index) => index + 1)
                      .map((count) => DropdownMenuItem<int>(
                            value: count,
                            child: Text(count.toString()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      viewModel.setGuestCount(value);
                    }
                  },
                  validator: (value) => viewModel.validateGuestCount(value),
                ),
                20.verticalSpace,

                // Notes
                Text(
                  "Notes (Optional)",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                    controller: viewModel.notesController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "e.g., Near the window",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: AppColors.red90),
                      ),
                    )),
                32.verticalSpace,
                CustomElevatedButton(
                    text: "Submit ",
                    onPressed: () {
                      if (viewModel.formKey.currentState?.validate() ?? false) {
                        viewModel.submitReservation(context);
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  TableReservationViewModel viewModelBuilder(BuildContext context) =>
      TableReservationViewModel();
}
