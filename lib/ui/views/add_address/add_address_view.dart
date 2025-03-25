import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/assets.dart';
import 'package:food_bite/ui/widgets/custom_image_widget.dart';
import 'package:food_bite/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

import '../../common/text_styles.dart';
import '../../widgets/custom_elevated_button.dart';
import 'add_address_viewmodel.dart';

class AddAddressView extends StackedView<AddAddressViewModel> {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddAddressViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
          child: SizedBox.expand(
            // Ensures the scroll view takes full height
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height -
                      48.h, // Adjust for padding and SafeArea
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: AppImages.nearByIcon,
                        width: 160.w,
                        height: 160.h,
                        fit: BoxFit.contain,
                      ),
                      48.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        'Find Nearby Restaurants',
                        style: AppTextStyles.xlBold,
                      ),
                      6.verticalSpace,
                      Text(
                        textAlign: TextAlign.center,
                        'Enter your location or allow access to your location to find restaurants near you.',
                        style: AppTextStyles.mediumLight.copyWith(
                          color: AppColors.gray500,
                        ),
                      ),
                      40.verticalSpace,
                      if (viewModel.addressController.text.isEmpty)
                        CustomElevatedButton(
                          onPressed: () {
                            viewModel.useCurrentLocation();
                          },
                          text: 'Use current location',
                        ),
                      16.verticalSpace,
                      CustomTextField(
                        hintText: 'Enter a new address',
                        controller: viewModel.addressController,
                        onChanged: (value) {
                          viewModel.address =
                              value; // Updates address and triggers rebuild
                        },
                        validate: viewModel
                            .validateAddress, // Updated to use view model method
                        prefixIcon: const Icon(Icons.location_on_rounded),
                        suffixIcon: viewModel.addressController.text.isNotEmpty
                            ? Icon(Icons.cancel, color: AppColors.darkBlue)
                            : null,
                        onTapSuffix: () {
                          viewModel.addressController.clear();
                          viewModel.address = ''; // Ensure button reappears
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  AddAddressViewModel viewModelBuilder(BuildContext context) =>
      AddAddressViewModel();
}
