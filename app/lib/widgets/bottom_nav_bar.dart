import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FashionBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FashionBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_rounded, 'Home'),
              _buildNavItem(1, Icons.favorite_border_rounded, 'Wishlist'),
              _buildCenterItem(),
              _buildNavItem(3, Icons.search_rounded, 'Search'),
              _buildNavItem(4, Icons.person_outline_rounded, 'My Page'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: isActive ? AppColors.deepPink : AppColors.textLight,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isActive ? AppColors.deepPink : AppColors.textLight,
              fontWeight:
                  isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterItem() {
    final isActive = currentIndex == 2;
    return GestureDetector(
      onTap: () => onTap(2),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [AppColors.primaryPink, AppColors.deepPink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.deepPink.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.photo_camera_outlined,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
