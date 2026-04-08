import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class DressMeScreen extends StatefulWidget {
  const DressMeScreen({super.key});

  @override
  State<DressMeScreen> createState() => _DressMeScreenState();
}

class _DressMeScreenState extends State<DressMeScreen> {
  String _selectedSeasonal = 'Summer';
  String _selectedOccasion = 'School';
  String _selectedGeneral = 'Casual';
  String _styleKeyword = 'Casual';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildCreateButtons(),
              const SizedBox(height: 28),
              _buildSection(
                'Seasonal',
                ['Summer', 'Spring', 'Winter'],
                _selectedSeasonal,
                (v) => setState(() => _selectedSeasonal = v),
              ),
              const SizedBox(height: 20),
              _buildSection(
                'Occasion',
                ['School', 'Party', 'Vacation'],
                _selectedOccasion,
                (v) => setState(() => _selectedOccasion = v),
              ),
              const SizedBox(height: 20),
              _buildSection(
                'General',
                ['Casual', 'Formal', 'Smart-Casual'],
                _selectedGeneral,
                (v) => setState(() => _selectedGeneral = v),
              ),
              const SizedBox(height: 24),
              _buildStyleKeywords(),
              const SizedBox(height: 28),
              _buildGenerateButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        'DRESS ME',
        style: GoogleFonts.playfairDisplay(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          color: AppColors.textDark,
          letterSpacing: 3,
        ),
      ),
    );
  }

  Widget _buildCreateButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildCreateBtn(
              'Create Outfit\nYourself', Icons.edit_outlined),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildCreateBtn(
              'Create Outfit\nBy AI', Icons.auto_awesome_outlined),
        ),
      ],
    );
  }

  Widget _buildCreateBtn(String label, IconData icon) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.chipSelected,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
              height: 1.3,
            ),
          ),
          const SizedBox(width: 6),
          Icon(icon, size: 18, color: AppColors.deepPink),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> options,
      String selected, Function(String) onSelect) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.divider, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textMedium,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              ...options.map((opt) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () => onSelect(opt),
                      child: AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: selected == opt
                              ? AppColors.chipSelected
                              : AppColors.chipUnselected,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          opt,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: selected == opt
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: selected == opt
                                ? AppColors.deepPink
                                : AppColors.textMedium,
                          ),
                        ),
                      ),
                    ),
                  )),
              const Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 14, color: AppColors.textLight),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStyleKeywords() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Style Key Words',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textDark,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.divider, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryPink.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            _styleKeyword,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: AppColors.textMedium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenerateButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: AppColors.deepPink.withOpacity(0.4),
        ),
        child: Text(
          'GENERATE OUTFIT',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
