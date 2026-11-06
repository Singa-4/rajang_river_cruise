import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      viewModel.updateDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateStr =
        '${viewModel.selectedDate.day}/${viewModel.selectedDate.month}/${viewModel.selectedDate.year}';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trip Preferences & Settings',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 24),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_month, color: Colors.indigo),
              title: const Text('Cruise Date'),
              subtitle: Text(dateStr),
              trailing: ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select Date'),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(Icons.directions_boat, color: Colors.indigo),
                    SizedBox(width: 16),
                    Text('Transport Mode', style: TextStyle(fontSize: 16)),
                  ],
                ),
                DropdownButton<String>(
                  value: viewModel.selectedPackage,
                  items: viewModel.packages.map((String package) {
                    return DropdownMenuItem<String>(
                      value: package,
                      child: Text(package),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      viewModel.updatePackage(newValue);
                    }
                  },
                ),
              ],
            ),
            const Divider(height: 24),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.dark_mode, color: Colors.indigo),
              title: const Text('Dark Mode Theme'),
              value: viewModel.isDarkMode,
              onChanged: (bool value) {
                viewModel.toggleDarkMode(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}