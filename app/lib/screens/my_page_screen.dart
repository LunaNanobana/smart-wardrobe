import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildBodyStats(),
              const SizedBox(height: 16),
              _buildTabBar(),
              _buildClothesGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo
          Container(
            width: 130,
            height: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryPink.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/try_on_loading.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Elina',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '23',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.textMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildStatChip('Body type:', 'Square'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildMeasure('Weight:', '50 kg'),
                    const SizedBox(width: 8),
                    _buildMeasure('Height:', '174cm'),
                  ],
                ),
                const SizedBox(height: 8),
                _buildSkinTone(),
                const SizedBox(height: 10),
                _buildItemCount(),
                const SizedBox(height: 8),
                _buildAskBtn(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(String label, String value) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Text(
        '$label $value',
        style: GoogleFonts.poppins(
          fontSize: 11,
          color: AppColors.textMedium,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildMeasure(String label, String value) {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Text(
        '$label $value',
        style: GoogleFonts.poppins(
          fontSize: 10,
          color: AppColors.textMedium,
        ),
      ),
    );
  }

  Widget _buildSkinTone() {
    return Row(
      children: [
        Text(
          'Skin Tone',
          style: GoogleFonts.poppins(
            fontSize: 11,
            color: AppColors.textMedium,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFFE8B89A),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.divider, width: 1.5),
          ),
        ),
      ],
    );
  }

  Widget _buildItemCount() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '38 ',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.deepPink,
            ),
          ),
          TextSpan(
            text: 'items\nin the closet',
            style: GoogleFonts.poppins(
              fontSize: 11,
              color: AppColors.textMedium,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAskBtn() {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.deepPink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Ask for size\nrecommendations',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildBodyStats() {
    return const SizedBox.shrink();
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPink.withOpacity(0.2),
              blurRadius: 6,
            ),
          ],
        ),
        labelColor: AppColors.deepPink,
        unselectedLabelColor: AppColors.textLight,
        labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 12),
        tabs: const [
          Tab(text: 'All clothes'),
          Tab(text: 'Favorites'),
          Tab(text: 'Outfits'),
        ],
        dividerColor: Colors.transparent,
      ),
    );
  }

  Widget _buildClothesGrid() {
    final categories = [
      ('Дresses', ['search_result_shirt', 'my_page', 'try_on_result']),
      ('BOTTOMS & SKIRTS',
          ['my_page', 'search_result_shirt', 'try_on_result']),
      ('JACKETS', ['try_on_result', 'my_page', 'search_result_shirt']),
      ('INNER CLOTHES',
          ['search_result_shirt', 'try_on_result', 'my_page']),
    ];

    return Column(
      children: categories.map((cat) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cat.$1,
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMedium,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Icon(Icons.edit_outlined,
                      size: 14, color: AppColors.textLight),
                ],
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: cat.$2.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: 8),
                  itemBuilder: (_, i) => Container(
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color:
                              AppColors.primaryPink.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/images/${cat.$2[i]}.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
