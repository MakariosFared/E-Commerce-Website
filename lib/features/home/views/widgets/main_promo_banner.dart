import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPromoBanner extends StatelessWidget {
  const MainPromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF211C24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Pro.Beyond.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'IPhone 14\nPro',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 64,
              height: 1.1,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Created to change everything for the\nbetter. For everyone',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 32),
          OutlinedButton(
            onPressed: () {
              context.pushNamed('product_details');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Shop Now',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(height: 48),
          // Placeholder for the iPhone image
          SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 0,
                  child: Container(
                    width: 150,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white12, width: 2),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 20,
                  child: Container(
                    width: 140,
                    height: 230,
                    decoration: BoxDecoration(
                      color: const Color(0xFF55449A), // Purple tint to match
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.white12, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
