import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF202020).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFB19759),
          width: 1,
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Sura Name",
          hintStyle: const TextStyle(
            color: Color(0xFFFEFFE8),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              "assets/images/quran-svgrepo-com 1.png",
              height: 20,
              width: 20,
            ),
          ),
          suffixIcon: const SizedBox(width: 44),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
