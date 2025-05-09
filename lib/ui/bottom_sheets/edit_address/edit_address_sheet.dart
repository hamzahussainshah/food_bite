import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/data_service/body/address_model.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';
import 'edit_address_sheet_model.dart';

class EditAddressSheet extends StackedView<EditAddressSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const EditAddressSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EditAddressSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Form(
        key: viewModel.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Address",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              20.verticalSpace,
              CustomTextField(
                hintText: 'Street',
                controller: viewModel.streetController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Street is required';
                  }
                  return null;
                },
              ),
              10.verticalSpace,
              CustomTextField(
                hintText: 'City',
                controller: viewModel.cityController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'City is required';
                  }
                  return null;
                },
              ),
              10.verticalSpace,
              CustomTextField(
                hintText: 'Postal code',
                controller: viewModel.postalCodeController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Postal code is required';
                  }
                  return null;
                },
              ),
              10.verticalSpace,
              CustomTextField(
                hintText: 'Country',
                controller: viewModel.countryController,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Country is required';
                  }
                  return null;
                },
              ),
              20.verticalSpace,
              CustomElevatedButton(
                text: "Save",
                onPressed: () {
                  final Address oldAddress = request.data['address'];
                  if (viewModel.formKey.currentState!.validate() &&
                      (oldAddress.city !=
                              viewModel.cityController.text.trim() ||
                          oldAddress.postalCode !=
                              viewModel.postalCodeController.text.trim() ||
                          oldAddress.street !=
                              viewModel.streetController.text.trim() ||
                          oldAddress.country !=
                              viewModel.countryController.text.trim())) {
                    completer!(SheetResponse(
                      confirmed: true,
                      data: Address(
                        id: oldAddress.id,
                        street: viewModel.streetController.text.trim(),
                        city: viewModel.cityController.text.trim(),
                        postalCode: viewModel.postalCodeController.text.trim(),
                        country: viewModel.countryController.text.trim(),
                      ),
                    ));
                  }
                },
              ),
              15.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(EditAddressSheetModel viewModel) {
    final Address address = request.data['address'];
    viewModel.cityController.text = address.city;
    viewModel.postalCodeController.text = address.postalCode;
    viewModel.streetController.text = address.street;
    viewModel.countryController.text = address.country;

    super.onViewModelReady(viewModel);
  }

  @override
  EditAddressSheetModel viewModelBuilder(BuildContext context) =>
      EditAddressSheetModel();
}
