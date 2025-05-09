import 'package:flutter/material.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:food_bite/services/database_service.dart';
import 'package:food_bite/ui/widgets/snackbar.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';

import '../../../app/app.locator.dart';
import '../../common/app_colors.dart';

class TableReservationViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final DatabaseService _databaseService = locator<DatabaseService>();

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  // Form data
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int? _guestCount = 1; // Default to 1 guest
  bool _isSubmitting = false;

  // Getters
  int? get guestCount => _guestCount;
  bool get isSubmitting => _isSubmitting;

  // Date selection
  Future<void> selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime earliestDate =
        DateTime(now.year, now.month, now.day + 1); // Tomorrow

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: earliestDate,
      firstDate: earliestDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      // Check if the selected date is today (shouldn't happen due to firstDate, but just in case)
      final DateTime selectedDateOnly =
          DateTime(picked.year, picked.month, picked.day);
      final DateTime todayOnly = DateTime(now.year, now.month, now.day);
      if (selectedDateOnly.isAtSameMomentAs(todayOnly)) {
        await _dialogService.showDialog(
          title: "Invalid Date",
          description:
              "Same-day reservations are not allowed. Please select a date starting from tomorrow.",
          buttonTitle: "OK",
        );
        return;
      }

      _selectedDate = picked;
      dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  // Time selection
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final DateTime now = DateTime.now();
      final DateTime earliestDate =
          DateTime(now.year, now.month, now.day + 1); // Tomorrow

      // If a date is selected and it's the earliest allowed date (tomorrow)
      if (_selectedDate != null) {
        final DateTime selectedDateOnly = DateTime(
            _selectedDate!.year, _selectedDate!.month, _selectedDate!.day);
        final DateTime earliestDateOnly =
            DateTime(earliestDate.year, earliestDate.month, earliestDate.day);

        if (selectedDateOnly.isAtSameMomentAs(earliestDateOnly)) {
          // Combine selected date and time into a DateTime object
          final DateTime selectedDateTime = DateTime(
            _selectedDate!.year,
            _selectedDate!.month,
            _selectedDate!.day,
            picked.hour,
            picked.minute,
          );

          // Calculate the earliest allowed time (current time + 4 hours)
          final DateTime earliestAllowedTime =
              now.add(const Duration(hours: 4));

          // Check if the selected time is within 4 hours from now
          if (selectedDateTime.isBefore(earliestAllowedTime)) {
            await _dialogService.showDialog(
              title: "Invalid Time",
              description:
                  "Reservations must be made at least 4 hours in advance. Please select a later time.",
              buttonTitle: "OK",
            );
            return;
          }
        }
      }

      _selectedTime = picked;
      timeController.text = picked.format(context);
      notifyListeners();
    }
  }

  // Set guest count
  void setGuestCount(int count) {
    _guestCount = count;
    notifyListeners();
  }

  // Validation methods
  String? validateDate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a reservation date";
    }
    return null;
  }

  String? validateTime(String? value) {
    if (value == null || value.isEmpty) {
      return "Please select a reservation time";
    }
    return null;
  }

  String? validateGuestCount(int? value) {
    if (value == null || value < 1) {
      return "Please select the number of guests";
    }
    return null;
  }

  // Submit reservation
  Future<void> submitReservation(BuildContext context) async {
    setBusy(true);
    // Prepare the API data
    final String reservationDate = dateController.text;
    final String reservationTime = _selectedTime!.format(context);
    final int guestCount = _guestCount!;
    final String notes = notesController.text;

    final Map<String, dynamic> reservationData = {
      "reservationDate": reservationDate,
      "reservationTime": reservationTime,
      "guestCount": guestCount,
      "notes": notes,
    };

    try {
      var response = await _databaseService.makeReservation(reservationData);
      if (response.success) {
        showSuccessSnackBar("Success", "Table reservation made successfully");
      }
      _navigationService.popUntil(
        (route) => route.settings.name == Routes.navigationView,
      );
    } catch (e) {
      // Show error dialog
      showErrorSnackBar("Error", "Something went wrong. Please try again.");
      setBusy(false);
    } finally {
      _isSubmitting = false;
      setBusy(false);
      notifyListeners();
    }
    setBusy(false);
  }
}
