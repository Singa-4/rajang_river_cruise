import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  late CruiseDestination _destination;
  DateTime _selectedDate = DateTime.now();
  String _selectedPackage = 'Express Boat';
  bool _isDarkMode = false;

  final List<String> _packages = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  CruiseBookingViewModel() {
    _destination = CruiseDestination(
      title: 'Rajang River Express Cruise',
      location: 'Sibu Waterfront, Sarawak',
      imagePath: 'assets/river.jpg',
      description:
      'Experience the heart of Sibu along Malaysia\'s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements while experiencing authentic Sarawakian hospitality.',
      starCount: 41,
    );
  }

  // Getters for UI display
  CruiseDestination get destination => _destination;
  DateTime get selectedDate => _selectedDate;
  String get selectedPackage => _selectedPackage;
  List<String> get packages => _packages;
  bool get isDarkMode => _isDarkMode;

  // Actions & State Mutators
  void incrementStarCount() {
    _destination.starCount++;
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    _selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String newPackage) {
    _selectedPackage = newPackage;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}