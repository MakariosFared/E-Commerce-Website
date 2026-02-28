import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';
import '../../home/views/widgets/footer_section.dart';
import '../../home/views/widgets/home_app_bar.dart';
import 'widgets/category_products_grid.dart';
import 'widgets/filters_row.dart';
import 'widgets/pagination_widget.dart';

class CategoryProductsMobile extends StatelessWidget {
  const CategoryProductsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FiltersRow(),
            _ProductsResultCount(),
            CategoryProductsGrid(),
            PaginationWidget(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class _ProductsResultCount extends StatelessWidget {
  const _ProductsResultCount();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Text(
            'Products Result : ',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '85',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
