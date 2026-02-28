import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: AppTypography.h2),
              const SizedBox(height: 8),
              Text(
                'Sign up to explore the latest products and exclusive deals.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                controller: _nameController,
                label: 'Full Name',
                hint: 'John Doe',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 24),
              _buildTextField(
                controller: _emailController,
                label: 'Email Address',
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
              const SizedBox(height: 24),
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (val) => setState(() => _agreeToTerms = val!),
                    activeColor: Colors.black,
                  ),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'I agree to the ',
                        style: AppTypography.bodySmall,
                        children: [
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                    'Create Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: AppTypography.bodySmall,
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      'Log In',
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
}
