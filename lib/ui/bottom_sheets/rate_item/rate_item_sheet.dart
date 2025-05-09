import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'rate_item_sheet_model.dart';

class RateItemSheet extends StackedView<RateItemSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const RateItemSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RateItemSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Rate Item",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          10.verticalSpace,
          // Star Rating Widget
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  viewModel.setRating(index + 1);
                },
                child: Icon(
                  index < viewModel.rating ? Icons.star : Icons.star_border,
                  color: index < viewModel.rating ? Colors.amber : Colors.grey,
                  size: 30.sp,
                ),
              );
            }),
          ),
          20.verticalSpace,
          CustomTextField(
            hintText: "Comment",
            controller: viewModel.commentController,
          ),
          20.verticalSpace,
          // Submit Button

          CustomElevatedButton(
              text: "Submit",
              onPressed: () {
                completer!(SheetResponse(
                  confirmed: true,
                  data: {
                    'rating': viewModel.rating,
                    'comment': viewModel.commentController.text.trim(),
                  },
                ));
              }),
        ],
      ),
    );
  }

  @override
  RateItemSheetModel viewModelBuilder(BuildContext context) =>
      RateItemSheetModel();
}
