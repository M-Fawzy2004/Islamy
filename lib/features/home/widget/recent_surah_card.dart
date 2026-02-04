import 'package:flutter/material.dart';

class RecentSurahCard extends StatelessWidget {
  final String suraNameEn;
  final String suraNameAr;
  final String verses;

  const RecentSurahCard({
    super.key,
    required this.suraNameEn,
    required this.suraNameAr,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      width: 290,
      decoration: BoxDecoration(
        color: const Color(0xFFE2BE7F), // Primary Gold
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  suraNameEn,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  suraNameAr,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "$verses Verses",
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Placeholder for the mosque/book image
          Container(
            width: 153,
            height: 136,
            decoration: const BoxDecoration(
              image: DecorationImage(
                // Using a placeholder image or asset from the project if available
                // For now, using a network placeholder or asset placeholder
                image: AssetImage(
                    'assets/images/img_most_recent.png'), // Trying to use an existing asset name if it fits, or placeholder
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
