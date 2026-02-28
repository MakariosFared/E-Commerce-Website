import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class AddressStep extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const AddressStep({super.key, required this.onNext, required this.onBack});

  @override
  State<AddressStep> createState() => _AddressStepState();
}

class _AddressStepState extends State<AddressStep> {
  int selectedAddressIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Text('Select Address', style: AppTypography.h3),
        ),
        _buildAddressCard(
          0,
          '2118 Thornridge',
          '2118 Thornridge Cir. Syracuse, Connecticut 35624',
          '(209) 555-0104',
          'HOME',
        ),
        const SizedBox(height: 16),
        _buildAddressCard(
          1,
          'Headoffice',
          '2715 Ash Dr. San Jose, South Dakota 83475',
          '(704) 555-0127',
          'OFFICE',
        ),
        const SizedBox(height: 32),
        Center(
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_circle, size: 32),
              ),
              Text('Add New Address', style: AppTypography.bodySmall),
            ],
          ),
        ),
        const SizedBox(height: 32),
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

  Widget _buildAddressCard(
    int index,
    String title,
    String address,
    String phone,
    String label,
  ) {
    bool isSelected = selectedAddressIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedAddressIndex = index),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppTypography.bodyMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.edit, size: 16, color: Colors.grey),
                      const SizedBox(width: 12),
                      const Icon(Icons.close, size: 16, color: Colors.grey),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    address,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phone,
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
