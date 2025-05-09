import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_bite/app/app.bottomsheets.dart';
import 'package:food_bite/app/app.dialogs.dart';
import 'package:food_bite/app/app.locator.dart';
import 'package:food_bite/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        child: ProviderScope(
          child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.red,
              scaffoldBackgroundColor: Colors.white,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.red,
                accentColor:
                    Colors.redAccent, // For floating action buttons, etc.
                backgroundColor: Colors.white,
                errorColor: Colors.red[700], // For error states
              ).copyWith(
                secondary: Colors.redAccent, // Used for secondary actions
              ),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
          ),
        ),
      ),
    );
  }
}
