import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/booking_controls_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 'Sibu River Cruise & Heritage'
                  : 'Sibu River Cruise & Heritage (Landscape Split View)',
            ),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          ),
          body: OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? _buildPortraitView(context)
                  : _buildLandscapeView(context);
            },
          ),
        );
      },
    );
  }

  // Portrait Mode Layout: Single Column (ListView)
  Widget _buildPortraitView(BuildContext context) {
    return ListView(
      children: [
        HeaderImageWidget(imagePath: viewModel.destination.imagePath),
        TitleSectionWidget(
          title: viewModel.destination.title,
          location: viewModel.destination.location,
          starCount: viewModel.destination.starCount,
          onStarPressed: viewModel.incrementStarCount,
        ),
        const ActionBarWidget(),
        DescriptionWidget(description: viewModel.destination.description),
        BookingControlsWidget(viewModel: viewModel),
      ],
    );
  }

  // Landscape Mode Layout: Side-by-Side Split Pane (Row + Expanded)
  Widget _buildLandscapeView(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            child: HeaderImageWidget(imagePath: viewModel.destination.imagePath),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            children: [
              TitleSectionWidget(
                title: viewModel.destination.title,
                location: viewModel.destination.location,
                starCount: viewModel.destination.starCount,
                onStarPressed: viewModel.incrementStarCount,
              ),
              const ActionBarWidget(),
              DescriptionWidget(description: viewModel.destination.description),
              BookingControlsWidget(viewModel: viewModel),
            ],
          ),
        ),
      ],
    );
  }
}