// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/edit_address/edit_address_sheet.dart';
import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/bottom_sheets/rate_item/rate_item_sheet.dart';
import '../ui/bottom_sheets/select_country_code/select_country_code_sheet.dart';
import '../ui/bottom_sheets/select_photo/select_photo_sheet.dart';

enum BottomSheetType {
  notice,
  selectCountryCode,
  selectPhoto,
  rateItem,
  editAddress,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(request: request, completer: completer),
    BottomSheetType.selectCountryCode: (context, request, completer) =>
        SelectCountryCodeSheet(request: request, completer: completer),
    BottomSheetType.selectPhoto: (context, request, completer) =>
        SelectPhotoSheet(request: request, completer: completer),
    BottomSheetType.rateItem: (context, request, completer) =>
        RateItemSheet(request: request, completer: completer),
    BottomSheetType.editAddress: (context, request, completer) =>
        EditAddressSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
