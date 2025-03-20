import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/constants/countries_data_en.dart';

class SelectCountryCodeSheetModel extends BaseViewModel {
  TextEditingController searchController = TextEditingController();
  int selectedIndex = -1;
  List<Map> filteredCountries = [];
  final FocusNode searchFocus = FocusNode();

  bool isKeyboardVisible = false;

  SelectCountryCodeSheetModel() {
    // Listen to changes in the FocusNode

    searchFocus.addListener(_focusListener);
  }

  // Listener to detect keyboard visibility based on focus
  void _focusListener() {
    isKeyboardVisible = searchFocus.hasFocus;
    notifyListeners();
  }

  @override
  dispose() {
    if (searchFocus.hasListeners) {
      searchFocus.removeListener(_focusListener);
    }
    searchFocus.removeListener(_focusListener);
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  Future<void> onTap(int index, BuildContext context) async {
    if (searchFocus.hasFocus) {
      FocusScope.of(context).unfocus();
    }
    if (selectedIndex == index) {
      selectedIndex = -1;
    } else {
      selectedIndex = index;
    }
    notifyListeners();
  }

  void onChange(String value) {
    filteredCountries.clear(); // Clear the list before each new search
    if (value.isEmpty) {
      notifyListeners();
      return;
    }

    for (Map country in countriesDataEn) {
      if (country['name']
          .toString()
          .toLowerCase()
          .contains(value.toLowerCase())) {
        filteredCountries.add(country);
      } else if (country['dial_code'].toString().toLowerCase() ==
          value.toLowerCase()) {
        filteredCountries.add(country);
      } else if (country['code'].toString().toLowerCase() ==
          value.toLowerCase()) {
        filteredCountries.add(country);
      }
    }
    notifyListeners();
  }

// //
// onChange(String value) {
//   for (Map country in countriesDataEn) {
//     if (country['name']
//         .toString()
//         .toLowerCase()
//         .contains(value.toLowerCase())) {
//       filteredCountries.add(country);
//     } else if (country['dial_code'].toString().toLowerCase() ==
//         value.toLowerCase()) {
//       filteredCountries.add(country);
//     } else if (country['code'].toString().toLowerCase() ==
//         value.toLowerCase()) {
//       filteredCountries.add(country);
//     }
//   }
//
//   notifyListeners();
// }
}
