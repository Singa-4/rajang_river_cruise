import 'package:flutter/material.dart';

class TitleSectionWidget extends StatelessWidget {
  final String title;
  final String location;
  final int starCount;
  final VoidCallback onStarPressed;

  const TitleSectionWidget({
    super.key,
    required this.title,
    required this.location,
    required this.starCount,
    required this.onStarPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.star, color: Colors.orangeAccent),
            onPressed: onStarPressed,
          ),
          Text(
            '$starCount',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}