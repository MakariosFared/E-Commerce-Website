import 'package:flutter/material.dart';

/// Application Color Constants
class AppColors {
  AppColors._();

  // Primary Brand Colors (Modern Blue)
  static const Color primary = Color(0xFF2563EB); // Blue 600
  static const Color primaryDark = Color(0xFF1E40AF); // Blue 800
  static const Color primaryLight = Color(0xFF3B82F6); // Blue 500

  // Accent (CTA / Add to Cart)
  static const Color accent = Color(0xFFF59E0B); // Amber 500
  static const Color accentDark = Color(0xFFD97706); // Amber 600
  static const Color accentLight = Color(0xFFFBBF24); // Amber 400

  // Background
  static const Color background = Color(0xFFF9FAFB); // Light Gray
  static const Color surface = Color(0xFFFFFFFF); // White
  static const Color backgroundDark = Color(0xFF111827);
  static const Color surfaceDark = Color(0xFF1F2937);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827); // Dark Gray
  static const Color textSecondary = Color(0xFF6B7280); // Medium Gray
  static const Color textLight = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Status
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF0EA5E9);

  // Borders
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLight, primaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentLight, accentDark],
  );

  static const LinearGradient darkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [backgroundDark, surfaceDark],
  );
}
