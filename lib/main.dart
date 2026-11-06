import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const CruiseApp());
}

class CruiseApp extends StatefulWidget {
  const CruiseApp({super.key});

  @override
  State<CruiseApp> createState() => _CruiseAppState();
}

class _CruiseAppState extends State<CruiseApp> {
  final CruiseBookingViewModel _viewModel = CruiseBookingViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',
          themeMode: _viewModel.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.indigo,
            brightness: Brightness.dark,
          ),
          home: CruiseBookingScreen(viewModel: _viewModel),
        );
      },
    );
  }
}