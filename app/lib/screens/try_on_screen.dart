import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class TryOnScreen extends StatefulWidget {
  const TryOnScreen({super.key});

  @override
  State<TryOnScreen> createState() => _TryOnScreenState();
}

class _TryOnScreenState extends State<TryOnScreen>
    with SingleTickerProviderStateMixin {
  double _progress = 0.0;
  bool _isDone = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {
          _progress = _controller.value;
          if (_progress >= 1.0) _isDone = true;
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color: AppColors.textDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Photo try on',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildImageContainer(),
            const SizedBox(height: 24),
            Text(
              'Creating your look......',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.textMedium,
              ),
            ),
            const SizedBox(height: 14),
            _buildProgressBar(),
            if (_isDone) ...[
              const SizedBox(height: 20),
              _buildResultPreview(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildImageContainer() {
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _isDone
          ? Image.asset(
              'assets/images/try_on_result.png',
              fit: BoxFit.cover,
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/try_on_loading.png',
                  fit: BoxFit.cover,
                ),
                if (!_isDone)
                  Container(
                    color: Colors.white.withOpacity(
                        (1 - _progress * 1.5).clamp(0.0, 0.6)),
                  ),
              ],
            ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: AppColors.lightPink,
            valueColor: const AlwaysStoppedAnimation(AppColors.deepPink),
            minHeight: 8,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          '${(_progress * 100).toInt()}%',
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: AppColors.textMedium,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildResultPreview() {
    return Column(
      children: [
        Text(
          'Your look is ready! ✨',
          style: GoogleFonts.playfairDisplay(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.deepPink,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildActionBtn(Icons.favorite_border_rounded, 'Save'),
            const SizedBox(width: 16),
            _buildActionBtn(Icons.share_outlined, 'Share'),
            const SizedBox(width: 16),
            _buildActionBtn(Icons.shopping_bag_outlined, 'Buy'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionBtn(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.deepPink,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
