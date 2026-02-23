import 'package:e_commerce/features/home/views/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Browse By Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios, size: 16),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              CategoryCard(icon: Icons.phone_iphone, title: 'Phones'),
              CategoryCard(icon: Icons.watch, title: 'Smart Watches'),
              CategoryCard(icon: Icons.camera_alt_outlined, title: 'Cameras'),
              CategoryCard(icon: Icons.headphones, title: 'Headphones'),
              CategoryCard(icon: Icons.computer, title: 'Computers'),
              CategoryCard(icon: Icons.videogame_asset, title: 'Gaming'),
            ],
          ),
        ],
      ),
    );
  }
}
