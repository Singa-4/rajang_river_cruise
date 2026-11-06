import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imagePath;

  const HeaderImageWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: Image.asset(
        imagePath,
        height: 220,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 220,
            color: Colors.indigo.shade100,
            child: const Center(
              child: Icon(Icons.directions_boat, size: 64, color: Colors.indigo),
            ),
          );
        },
      ),
    );
  }
}