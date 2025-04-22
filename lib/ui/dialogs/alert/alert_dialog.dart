import 'package:flutter/material.dart';
import 'package:food_bite/ui/common/app_colors.dart';
import 'package:food_bite/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../common/text_styles.dart';
import 'alert_dialog_model.dart';

const double _graphicSize = 60;

class AlertDialog extends StackedView<AlertDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AlertDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context,
      AlertDialogModel viewModel,
      Widget? child,
      ) {
    // Determine success or failure from request.data
    final isSuccess = request.data is bool && request.data == true;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon and title row
            Row(
              children: [
                Container(
                  width: _graphicSize,
                  height: _graphicSize,
                  decoration: BoxDecoration(
                    color: isSuccess ? AppColors.green.withValues(alpha: 0.6) : AppColors.red60,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isSuccess ? Icons.check_circle : Icons.warning_amber_rounded,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: Text(
                    request.title ?? (isSuccess ? 'Success' : 'Alert'),
                    style: AppTextStyles.lSemibold.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.headingColor,
                    ),
                  ),
                ),
              ],
            ),

            verticalSpaceMedium,

            // Description
            if (request.description != null)
              Text(
                request.description!,
                style: AppTextStyles.mSemibold.copyWith(
                  color: AppColors.gray600,
                ),
              ),

            verticalSpaceLarge,

            // Confirm button
            GestureDetector(
              onTap: () => completer(DialogResponse(confirmed: true)),
              child: Container(
                height: 48,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSuccess ? AppColors.green : AppColors.red90,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'OK',
                  style: AppTextStyles.mSemibold.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  AlertDialogModel viewModelBuilder(BuildContext context) => AlertDialogModel();
}
