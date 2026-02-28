import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class ProductVariants extends StatefulWidget {
  const ProductVariants({super.key});

  @override
  State<ProductVariants> createState() => _ProductVariantsState();
}

class _ProductVariantsState extends State<ProductVariants> {
  final List<Color> colors = [
    Colors.black,
    Colors.deepPurple,
    Colors.red,
    Colors.amber,
    Colors.white,
  ];
  final List<String> sizes = ['128 GB', '256 GB', '512 GB', '1 TB'];

  int selectedColorIndex = 1;
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Color',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Row(
          children: List.generate(
            colors.length,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedColorIndex = index),
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selectedColorIndex == index
                        ? AppColors.primary
                        : Colors.transparent,
                    width: 2,
                  ),
                ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colors[index],
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Storage Capacity',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(
            sizes.length,
            (index) => GestureDetector(
              onTap: () => setState(() => selectedSizeIndex = index),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: selectedSizeIndex == index
                      ? AppColors.primary
                      : AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectedSizeIndex == index
                        ? AppColors.primary
                        : AppColors.border,
                  ),
                ),
                child: Text(
                  sizes[index],
                  style: TextStyle(
                    color: selectedSizeIndex == index
                        ? Colors.white
                        : AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
