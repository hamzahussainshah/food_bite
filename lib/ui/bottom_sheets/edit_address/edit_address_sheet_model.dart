import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class EditAddressSheetModel extends BaseViewModel {
  final TextEditingController streetController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
}
