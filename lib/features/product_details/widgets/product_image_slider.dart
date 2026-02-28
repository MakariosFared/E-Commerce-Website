import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final List<String> images = [
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-unselect-gallery-1-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660754254474',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-unselect-gallery-2-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661193306633',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-unselect-gallery-3-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661835703816',
    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-unselect-gallery-4-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1661835703816',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Image.network(
                    images[selectedIndex],
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image,
                      size: 100,
                      color: AppColors.textLight,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selectedIndex == index
                          ? AppColors.primary
                          : AppColors.border,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      images[index],
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image_outlined),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
