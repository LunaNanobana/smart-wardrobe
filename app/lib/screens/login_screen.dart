import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'home_screen.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  bool _obscurePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Logo
              _buildLogo(),
              const SizedBox(height: 28),
              // Tab switcher
              _buildTabSwitcher(),
              const SizedBox(height: 32),
              // Fields
              _buildTextField(
                controller: _emailController,
                hint: 'Username or Email',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _passwordController,
                hint: 'Password',
                icon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 28),
              // Login button
              _buildLoginButton(),
              const SizedBox(height: 20),
              // OR divider
              _buildOrDivider(),
              const SizedBox(height: 16),
              // Social buttons
              _buildSocialButtons(),
              const SizedBox(height: 24),
              // Sign up link
              _buildSignUpLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Circle decoration
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryPink.withOpacity(0.4),
                width: 2,
              ),
            ),
          ),
          // Logo image
          Image.asset(
            'assets/images/logo.png',
            height: 170,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.lightPink,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildTab('Log In', true),
          _buildTab('Sign Up', false),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isLoginTab) {
    final isActive = (isLoginTab && _isLogin) || (!isLoginTab && !_isLogin);
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _isLogin = isLoginTab),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isActive ? AppColors.deepPink : Colors.transparent,
            borderRadius: BorderRadius.circular(26),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: isActive ? Colors.white : AppColors.textMedium,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryPink.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? _obscurePassword : false,
        style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textDark),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.textLight, size: 20),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.textLight,
                    size: 20,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                )
              : null,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide:
                BorderSide(color: AppColors.divider.withOpacity(0.5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide:
                const BorderSide(color: AppColors.deepPink, width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
          hintStyle: GoogleFonts.poppins(
              color: AppColors.textLight, fontSize: 13.5),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainShell()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepPink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 4,
          shadowColor: AppColors.deepPink.withOpacity(0.4),
        ),
        child: Text(
          'LOG IN',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildOrDivider() {
    return Row(
      children: [
        Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '- OR Continue with -',
            style: GoogleFonts.poppins(
                color: AppColors.textLight, fontSize: 11),
          ),
        ),
        Expanded(
            child: Divider(color: AppColors.divider, thickness: 1)),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialBtn('G', const Color(0xFFEA4335)),
        const SizedBox(width: 16),
        _buildSocialBtn('', Colors.black,
            icon: Icons.apple_rounded),
        const SizedBox(width: 16),
        _buildSocialBtn('f', const Color(0xFF1877F2)),
      ],
    );
  }

  Widget _buildSocialBtn(String letter, Color color, {IconData? icon}) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.divider, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, size: 24, color: color)
            : Text(
                letter,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Create An Account ',
          style: GoogleFonts.poppins(
              color: AppColors.textMedium, fontSize: 13),
        ),
        GestureDetector(
          onTap: () => setState(() => _isLogin = false),
          child: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              color: AppColors.deepPink,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
