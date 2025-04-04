import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/common/text_styles.dart';
import 'package:food_bite/ui/widgets/custom_elevated_button.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/custom_navbar.dart';
import 'add_card_viewmodel.dart';

class AddCardView extends StackedView<AddCardViewModel> {
  const AddCardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddCardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Payment Methods",
        onBackPressed: () {
          viewModel.back();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Card",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        20.verticalSpace,
                        CustomTextField(
                          hintText: "Cardholder name",
                          controller: viewModel.cardHolderNameController,
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter cardholder name';
                            }
                            return null;
                          },
                        ),
                        10.verticalSpace,
                        CustomTextField(
                            hintText: "Enter Card number",
                            controller: viewModel.cardNumberController,
                            validate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter card number';
                              }
                              return null;
                            }),
                        10.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextField(
                                  hintText: "MM/YY",
                                  controller: viewModel.expiryDateController,
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter expiry date';
                                    }
                                    return null;
                                  }),
                            ),
                            10.horizontalSpace,
                            Expanded(
                              child: CustomTextField(
                                  hintText: "CVC",
                                  controller: viewModel.cvvController,
                                  validate: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter CVC';
                                    }
                                    return null;
                                  }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomElevatedButton(
                  text: "Add Card",
                  onPressed: () {
                    if (viewModel.formKey.currentState!.validate()) {
                      // viewModel.addCard();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddCardViewModel viewModelBuilder(BuildContext context) => AddCardViewModel();
}
