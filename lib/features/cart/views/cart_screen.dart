import 'package:flutter/material.dart';
import '../../../core/utils/responsive/responsive_builder.dart';
import '../../../core/utils/responsive/size_config.dart';
import 'cart_mobile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return const ResponsiveBuilder(
      mobile: CartMobile(),
      tablet: CartMobile(),
      desktop: CartMobile(),
    );
  }
}
