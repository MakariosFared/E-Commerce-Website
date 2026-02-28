import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class CheckoutStepIndicator extends StatelessWidget {
  final int currentStep;
  const CheckoutStepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStep(
            '1',
            'Address',
            isActive: currentStep >= 1,
            isCompleted: currentStep > 1,
            icon: Icons.location_on,
          ),
          _buildStep(
            '2',
            'Shipping',
            isActive: currentStep >= 2,
            isCompleted: currentStep > 2,
            icon: Icons.local_shipping,
          ),
          _buildStep(
            '3',
            'Payment',
            isActive: currentStep >= 3,
            isCompleted: currentStep > 3,
            icon: Icons.payment,
          ),
        ],
      ),
    );
  }

  Widget _buildStep(
    String number,
    String label, {
    required bool isActive,
    required bool isCompleted,
    required IconData icon,
  }) {
    final Color color = isCompleted || isActive
        ? AppColors.textPrimary
        : AppColors.textLight;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(isCompleted ? Icons.check : icon, size: 18, color: color),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Step $number',
              style: AppTypography.caption.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              label,
              style: AppTypography.bodySmall.copyWith(
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
