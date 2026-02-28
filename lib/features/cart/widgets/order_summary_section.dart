import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary', style: AppTypography.h3),
          const SizedBox(height: 24),
          _buildInputField('Discount code / Promo code', 'Code'),
          const SizedBox(height: 16),
          _buildInputField(
            'Your bonus card number',
            'Enter Card Number',
            showApply: true,
          ),
          const SizedBox(height: 32),
          _buildSummaryRow('Subtotal', '\$2347'),
          const SizedBox(height: 12),
          _buildSummaryRow('Estimated Tax', '\$50'),
          const SizedBox(height: 12),
          _buildSummaryRow('Estimated shipping & Handling', '\$29'),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          _buildSummaryRow('Total', '\$2426', isTotal: true),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Checkout',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {bool showApply = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: hint,
                      border: InputBorder.none,
                      hintStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textLight,
                      ),
                    ),
                  ),
                ),
              ),
              if (showApply)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.textPrimary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: AppTypography.labelLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? AppTypography.h4.copyWith(fontWeight: FontWeight.bold)
              : AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
        ),
        Text(
          value,
          style: isTotal
              ? AppTypography.h3.copyWith(fontWeight: FontWeight.bold)
              : AppTypography.bodyLarge.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
