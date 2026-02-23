import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import 'widgets/category_section.dart';
import 'widgets/discount_section.dart';
import 'widgets/footer_section.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/main_promo_banner.dart';
import 'widgets/product_tabs_section.dart';
import 'widgets/summer_sale_banner.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: HomeAppBar(),
      drawer: Drawer(
        backgroundColor: AppColors.backgroundDark,
        child: Builder(
          builder: (drawerContext) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MainPromoBanner(),
            CategorySection(),
            ProductTabsSection(),
            DiscountSection(),
            SummerSaleBanner(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
