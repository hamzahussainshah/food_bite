import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../common/app_colors.dart';
import '../../common/assets.dart';
import '../../common/text_styles.dart';
import '../../core/constants/countries_data_en.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_image_widget.dart';
import '../../widgets/custom_text_field.dart';
import 'select_country_code_sheet_model.dart';

class SelectCountryCodeSheet extends StackedView<SelectCountryCodeSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SelectCountryCodeSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SelectCountryCodeSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      height: 0.92.sh,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          16.verticalSpace,
          Container(
            height: 5.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: AppColors.gray200,
              borderRadius: BorderRadius.circular(100.r),
            ),
          ),
          30.verticalSpace,
          Text(
            request.title!,
            style: AppTextStyles.lSemibold.copyWith(
              color: AppColors.gray800,
            ),
          ),
          16.verticalSpace,
          CustomTextField(
            focusNode: viewModel.searchFocus,
            hintText: 'Search by title',
            controller: viewModel.searchController,
            onChanged: (value) {
              viewModel.onChange(value);
            },
            prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 24.sp,
                )),
          ),
          16.verticalSpace,
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.searchController.text.isEmpty
                  ? countriesDataEn.length
                  : viewModel.filteredCountries.length,
              itemBuilder: (context, index) {
                Map contry = viewModel.searchController.text.isEmpty
                    ? countriesDataEn[index]
                    : viewModel.filteredCountries[index];

                String countryName = contry['name']
                            .toString()
                            .split(',')
                            .first
                            .length >
                        25
                    ? '${contry['name'].toString().split(',').first.substring(0, 25)}...'
                    : contry['name'].toString().split(',').first;
                return InkWell(
                  onTap: () => viewModel.onTap(index, context),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: viewModel.selectedIndex == index
                            ? AppColors.red90
                            : AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          imagePath: AppIcons.countryFlag(
                              contry['code'].toString().toLowerCase()),
                          height: 20.h,
                          width: 20.w,
                          radius: BorderRadius.circular(100.r),
                        ),
                        if (request.data['dial_code'] == true) ...[
                          8.horizontalSpace,
                          Text(
                            contry['dial_code'],
                            style: viewModel.selectedIndex == index
                                ? AppTextStyles.xSSemibold.copyWith(
                                    color: AppColors.red90,
                                  )
                                : AppTextStyles.xsRegular.copyWith(
                                    color: AppColors.gray500,
                                  ),
                          ),
                        ],
                        8.horizontalSpace,
                        Text(
                          countryName,
                          style: viewModel.selectedIndex == index
                              ? AppTextStyles.xSSemibold.copyWith(
                                  color: AppColors.red90,
                                )
                              : AppTextStyles.xsRegular.copyWith(
                                  color: AppColors.gray500,
                                ),
                        ),
                        // Text(countriesDataEn[index]['code']),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          16.verticalSpace,
          if (!viewModel.isKeyboardVisible) ...[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    text: request.data['buttonOneText'],
                    isDisabled: viewModel.selectedIndex != -1 ? false : true,
                    onPressed: viewModel.selectedIndex == -1
                        ? null
                        : () {
                            completer!(SheetResponse(
                                confirmed: true,
                                data: viewModel.searchController.text.isEmpty
                                    ? countriesDataEn[viewModel.selectedIndex]
                                    : viewModel.filteredCountries[
                                        viewModel.selectedIndex]));
                            viewModel.dispose();
                          },
                  ),
                  8.verticalSpace,
                  CustomButton(
                    text: request.data['buttonTwoText'],
                    isBgColor: false,
                    onPressed: () {
                      completer!(SheetResponse(confirmed: false));
                    },
                  ),
                ],
              ),
            ),
          ],
          16.verticalSpace,
        ],
      ),
    );
  }

  @override
  SelectCountryCodeSheetModel viewModelBuilder(BuildContext context) =>
      SelectCountryCodeSheetModel();
}
