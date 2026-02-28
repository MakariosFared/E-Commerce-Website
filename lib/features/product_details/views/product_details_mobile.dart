import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';
import '../../home/views/widgets/footer_section.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/product_info.dart';
import '../widgets/product_variants.dart';
import '../widgets/product_details_section.dart';
import '../widgets/reviews_section.dart';
import '../widgets/related_products.dart';

class ProductDetailsMobile extends StatelessWidget {
  const ProductDetailsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Product Details',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Breadcrumbs(),
                  const SizedBox(height: 20),
                  const ProductImageSlider(),
                  const SizedBox(height: 24),
                  const ProductInfo(),
                  const SizedBox(height: 24),
                  const ProductVariants(),
                  const SizedBox(height: 32),
                  _buildActionButtons(),
                  const SizedBox(height: 48),
                  const ProductDetailsSection(),
                  const SizedBox(height: 48),
                  const ReviewsSection(),
                  const SizedBox(height: 48),
                  const RelatedProducts(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Buy Now',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Breadcrumbs extends StatelessWidget {
  const _Breadcrumbs();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Home',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const Icon(
          Icons.chevron_right,
          size: 14,
          color: AppColors.textSecondary,
        ),
        Text(
          'Apple',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const Icon(
          Icons.chevron_right,
          size: 14,
          color: AppColors.textSecondary,
        ),
        Text(
          'iPhone 14 Pro Max',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
