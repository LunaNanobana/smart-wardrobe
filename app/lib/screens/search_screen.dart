import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'try_on_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _hasResult = false;
  String _query = 'women\'s t-shirts';

  final List<String> _items = [
    'assets/images/search_result_shirt.png',
    'assets/images/my_page.png',
    'assets/images/try_on_result.png',
    'assets/images/search_result_shirt.png',
    'assets/images/my_page.png',
    'assets/images/try_on_result.png',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => _hasResult = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 16),
            Expanded(
              child: _hasResult ? _buildResults() : _buildEmpty(),
            ),
            _buildPhotoTryOnButton(context),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: AppColors.divider, width: 1.5),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPink.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Text(
              'Found: $_query',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
            const Spacer(),
            Icon(Icons.close_rounded,
                color: AppColors.textLight, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.photo_camera_outlined,
              size: 60, color: AppColors.textLight),
          const SizedBox(height: 12),
          Text(
            'Take a photo to find clothes',
            style: GoogleFonts.poppins(
                color: AppColors.textLight, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: _items.length,
      itemBuilder: (ctx, i) => _buildProductCard(_items[i]),
    );
  }

  Widget _buildProductCard(String imgPath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TryOnScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPink.withOpacity(0.12),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'T-Shirt',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textDark),
                  ),
                  Icon(Icons.favorite_border_rounded,
                      size: 16, color: AppColors.deepPink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoTryOnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TryOnScreen()),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
                color: AppColors.deepPink, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Photo try on',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AppColors.deepPink,
            ),
          ),
        ),
      ),
    );
  }
}
