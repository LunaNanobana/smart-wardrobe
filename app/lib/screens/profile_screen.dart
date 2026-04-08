import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFB6C1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileCard(),
              Container(
                color: AppColors.background,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildButtons(),
                    const SizedBox(height: 20),
                    _buildActivitySection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFFB6C1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.notifications_outlined,
                  color: AppColors.textDark, size: 24),
            ],
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/user_profile.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Alina Adibekova',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
          Text(
            '@alinas85',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textMedium,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.calendar_today_outlined,
                  size: 12, color: AppColors.textMedium),
              const SizedBox(width: 4),
              Text(
                '30.10.2002',
                style: GoogleFonts.poppins(
                    fontSize: 11, color: AppColors.textMedium),
              ),
              const SizedBox(width: 12),
              Icon(Icons.location_on_outlined,
                  size: 12, color: AppColors.textMedium),
              const SizedBox(width: 4),
              Text(
                'Astana, KZ',
                style: GoogleFonts.poppins(
                    fontSize: 11, color: AppColors.textMedium),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildProfileBtn(
              'My outfits', Icons.grid_view_rounded),
        ),
        const SizedBox(width: 12),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.divider, width: 1.5),
          ),
          child: const Icon(Icons.favorite_border_rounded,
              color: AppColors.deepPink),
        ),
      ],
    );
  }

  Widget _buildProfileBtn(String label, IconData icon) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.divider, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(width: 6),
          Icon(icon, size: 16, color: AppColors.deepPink),
        ],
      ),
    );
  }

  Widget _buildActivitySection() {
    return Column(
      children: [
        _buildActivityTile(
          '25 june 2025',
          '6:00 AM',
          Icons.wb_sunny_outlined,
          'Sunny',
          null,
        ),
        const Divider(color: AppColors.divider, height: 20),
        _buildActivityTile(
          '11:00 AM',
          '6:00 AM',
          null,
          null,
          'Upload your outfit',
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_photo_alternate_outlined,
                size: 20),
            label: Text(
              'Upload Outfit',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600, fontSize: 14),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.deepPink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityTile(
    String time1,
    String time2,
    IconData? icon,
    String? weather,
    String? uploadText,
  ) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time1,
                style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark)),
            Text(
              '25%/18%',
              style: GoogleFonts.poppins(
                  fontSize: 10, color: AppColors.textLight),
            ),
          ],
        ),
        const SizedBox(width: 16),
        if (icon != null) Icon(icon, color: AppColors.deepPink, size: 28),
        if (weather != null) ...[
          const SizedBox(width: 8),
          Text(
            weather,
            style: GoogleFonts.poppins(
                fontSize: 12, color: AppColors.textMedium),
          ),
        ],
        if (uploadText != null) ...[
          const Spacer(),
          Text(
            uploadText,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.deepPink,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}
