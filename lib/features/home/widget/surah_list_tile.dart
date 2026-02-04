import 'package:flutter/material.dart';

class SuraListTile extends StatelessWidget {
  final int number;
  final String nameEn;
  final String nameAr;
  final int verses;

  const SuraListTile({
    super.key,
    required this.number,
    required this.nameEn,
    required this.nameAr,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          // Star Icon with Number
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/Group.png",
                height: 50,
              ),
              Text(
                "$number",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // English Name and Verses Count
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameEn,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "$verses Verses",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Arabic Name
          Text(
            nameAr,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
