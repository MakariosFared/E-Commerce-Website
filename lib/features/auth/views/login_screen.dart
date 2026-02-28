import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 48),
              Center(
                child: Text(
                  'cyber',
                  style: AppTypography.h1.copyWith(
                    fontSize: 32,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Text('Welcome Back!', style: AppTypography.h2),
              const SizedBox(height: 8),
              Text(
                'Let\'s log in to your Cyber account.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 48),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'example@mail.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                hint: '••••••••',
                isPassword: true,
                obscureText: _obscurePassword,
                onToggleVisibility: () =>
                    setState(() => _obscurePassword = !_obscurePassword),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go('/'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR', style: AppTypography.caption),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 32),
              _buildSocialButton(
                icon: Icons.g_mobiledata,
                label: 'Continue with Google',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              _buildSocialButton(
                icon: Icons.apple,
                label: 'Continue with Apple',
                onPressed: () {},
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: AppTypography.bodySmall,
                  ),
                  TextButton(
                    onPressed: () => context.pushNamed('register'),
                    child: Text(
                      'Sign Up',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppTypography.bodyMedium,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: AppColors.textLight,
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: const BorderSide(color: AppColors.border),
          foregroundColor: AppColors.textPrimary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
