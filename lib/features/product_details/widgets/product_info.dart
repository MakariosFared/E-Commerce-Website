import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String price;
  final String originalPrice;
  final double rating;
  final int reviewsCount;
  final bool isInStock;

  const ProductInfo({
    super.key,
    this.title = 'Apple iPhone 14 Pro Max',
    this.price = '\$1399',
    this.originalPrice = '\$1599',
    this.rating = 4.8,
    this.reviewsCount = 422,
    this.isInStock = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isInStock
                    ? AppColors.success.withOpacity(0.1)
                    : AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                isInStock ? 'In Stock' : 'Out of Stock',
                style: AppTypography.bodySmall.copyWith(
                  color: isInStock ? AppColors.success : AppColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.accent, size: 20),
                const SizedBox(width: 4),
                Text(
                  rating.toString(),
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' ($reviewsCount)',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(title, style: AppTypography.h2),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              price,
              style: AppTypography.h3.copyWith(color: AppColors.primary),
            ),
            const SizedBox(width: 12),
            Text(
              originalPrice,
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
