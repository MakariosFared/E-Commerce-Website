import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class ProductDetailsSection extends StatelessWidget {
  const ProductDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Details', style: AppTypography.h3),
        const SizedBox(height: 12),
        Text(
          'The iPhone 14 Pro Max is the ultimate iPhone. It features an always-on display, the first-ever 48MP camera on iPhone, Crash Detection, and Emergency SOS via satellite. A whole new way to interact with iPhone thanks to Dynamic Island.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        Text('Key Features', style: AppTypography.h3),
        const SizedBox(height: 16),
        _buildFeatureRow('Display', '6.7-inch Super Retina XDR'),
        _buildFeatureRow('Processor', 'A16 Bionic Chip'),
        _buildFeatureRow('Main Camera', '48MP Quad-Pixel Sensor'),
        _buildFeatureRow('Battery', 'Up to 29 hours video playback'),
        _buildFeatureRow('Storage', '128 GB to 1 TB'),
        _buildFeatureRow('Sim Card', 'Dual Sim Support'),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              _buildSimpleInfoRow(
                Icons.local_shipping_outlined,
                'Free Worldwide Shipping',
              ),
              const Divider(height: 24),
              _buildSimpleInfoRow(
                Icons.security_outlined,
                '24 Months Full Warranty',
              ),
              const Divider(height: 24),
              _buildSimpleInfoRow(
                Icons.history_edu_outlined,
                '100 Days Money Back',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            value,
            style: AppTypography.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleInfoRow(IconData icon, String label) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 24),
        const SizedBox(width: 16),
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          size: 14,
          color: AppColors.textLight,
        ),
      ],
    );
  }
}
