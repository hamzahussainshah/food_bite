import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  HistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryViewModel();
}
