import 'package:flutter/material.dart';
import '../../../core/utils/responsive/responsive_builder.dart';
import '../../../core/utils/responsive/size_config.dart';
import 'product_details_mobile.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ResponsiveBuilder(
      mobile: const ProductDetailsMobile(),
      tablet:
          const ProductDetailsMobile(), // For now, reuse mobile or I can create tablet later if needed
      desktop:
          const ProductDetailsMobile(), // Simplified for now but following same structure
    );
  }
}
