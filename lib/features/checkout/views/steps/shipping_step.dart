import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class ShippingStep extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const ShippingStep({super.key, required this.onNext, required this.onBack});

  @override
  State<ShippingStep> createState() => _ShippingStepState();
}

class _ShippingStepState extends State<ShippingStep> {
  int selectedShipmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Text('Shipment Method', style: AppTypography.h3),
        ),
        _buildShipmentCard(0, 'Free', 'Regulary shipment', '17 Oct, 2023'),
        const SizedBox(height: 16),
        _buildShipmentCard(
          1,
          '\$8.50',
          'Get your delivery as soon as possible',
          '1 Oct, 2023',
        ),
        const SizedBox(height: 16),
        _buildShipmentCard(
          2,
          'Schedule',
          'Pick a date when you want to get your delivery',
          'Select Date',
          isSchedule: true,
        ),
        const SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: OutlinedButton(
                    onPressed: widget.onBack,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Next'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShipmentCard(
    int index,
    String price,
    String description,
    String date, {
    bool isSchedule = false,
  }) {
    bool isSelected = selectedShipmentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedShipmentIndex = index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.withOpacity(0.05) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.black : AppColors.divider,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (!isSchedule)
                        Text(
                          date,
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      if (isSchedule)
                        Row(
                          children: [
                            Text(
                              date,
                              style: AppTypography.bodySmall.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const Icon(
                              Icons.expand_more,
                              size: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
