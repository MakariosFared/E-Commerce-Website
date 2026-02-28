import 'package:flutter/material.dart';
import '../../../../features/home/views/widgets/product_card.dart';

class CategoryProductsGrid extends StatelessWidget {
  const CategoryProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data matching the image
    final items = [
      {'title': 'Apple iPhone 14 Pro 512GB Gold...', 'price': '1437'},
      {'title': 'Apple iPhone 11 128GB White (M...', 'price': '510'},
      {'title': 'Apple iPhone 11 128GB White...', 'price': '550'},
      {'title': 'Apple iPhone 14 Pro 1TB Gold (M...', 'price': '1499'},
      {'title': 'Apple iPhone 14 Pro 1TB Gold (M...', 'price': '1399'},
      {'title': 'Apple iPhone 14 Pro 128GB Deep...', 'price': '1600'},
      {'title': 'Apple iPhone 13 mini 128GB Pink...', 'price': '850'},
      {'title': 'Apple iPhone 14 Pro 256GB Spac...', 'price': '1399'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return ProductCard(title: item['title']!, price: item['price']!);
        },
      ),
    );
  }
}
