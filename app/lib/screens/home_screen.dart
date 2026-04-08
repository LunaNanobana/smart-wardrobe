import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    _buildSearchBar(),
                    const SizedBox(height: 20),
                    _buildCategoryRow(),
                    const SizedBox(height: 20),
                    _buildBannerGrid(),
                    const SizedBox(height: 20),
                    _buildSecondHandCard(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu_rounded,
              color: AppColors.textDark, size: 26),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.primaryPink, width: 2),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/user_profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Icon(Icons.search_rounded,
              color: AppColors.textLight, size: 20),
          const SizedBox(width: 10),
          Text(
            'Search anything...',
            style: GoogleFonts.poppins(
                color: AppColors.textLight, fontSize: 13.5),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow() {
    final cats = [
      ('Current\nTrends', 'assets/images/my_page.png'),
      ('New\nOutfits', 'assets/images/try_on_result.png'),
      ('Shops', 'assets/images/search_result_shirt.png'),
      ('Brands', 'assets/images/user_profile.png'),
    ];
    return SizedBox(
      height: 82,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cats.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, i) => _buildCategoryItem(
            cats[i].$1, cats[i].$2),
      ),
    );
  }

  Widget _buildCategoryItem(String label, String imgPath) {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: AppColors.primaryPink, width: 2),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryPink.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(imgPath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              fontSize: 9.5,
              color: AppColors.textMedium,
              fontWeight: FontWeight.w500,
              height: 1.2),
        ),
      ],
    );
  }

  Widget _buildBannerGrid() {
    return Column(
      children: [
        _buildBannerCard(
          'Brise Enchantee',
          'assets/images/search_result_shirt.png',
          const Color(0xFFF8C8D8),
        ),
        const SizedBox(height: 12),
        _buildBannerCard(
          'Brise Enchantee',
          'assets/images/login_screen.png',
          const Color(0xFFF9D0DC),
        ),
      ],
    );
  }

  Widget _buildBannerCard(
      String title, String imgPath, Color bg) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 150,
            child: Image.asset(imgPath, fit: BoxFit.cover),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'COSMETIC',
                    style: GoogleFonts.poppins(
                        fontSize: 9,
                        fontWeight: FontWeight.w600,
                        color: AppColors.deepPink),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondHandCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFC5D5),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.25),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.check_rounded,
                color: AppColors.deepPink, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Second-Hand',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepPink,
                  ),
                ),
                Text(
                  'Prevent\nOverconsumption',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Take your extra clothes to\nour second-hand store.',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: AppColors.textMedium,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
