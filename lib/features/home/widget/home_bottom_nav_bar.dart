import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HomeBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFE2BE7F),
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: const Color(0xFF202020),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedLabelStyle:
          const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
      items: [
        _buildBottomItem(
            iconPath: "assets/svg/1.svg", label: "Quran", index: 0),
        _buildBottomItem(
            iconPath: "assets/svg/2.svg", label: "Hadith", index: 1),
        _buildBottomItem(
            iconPath: "assets/svg/3.svg", label: "Sebha", index: 2),
        _buildBottomItem(
            iconPath: "assets/svg/4.svg", label: "Radio", index: 3),
        _buildBottomItem(
            iconPath: "assets/svg/5.svg", label: "Times", index: 4),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomItem({
    required String iconPath,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(Color(0xFF202020), BlendMode.srcIn),
        height: 24,
      ),
      activeIcon: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF202020).withOpacity(0.6),
          borderRadius: BorderRadius.circular(25),
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          height: 24,
        ),
      ),
      label: label,
    );
  }
}
