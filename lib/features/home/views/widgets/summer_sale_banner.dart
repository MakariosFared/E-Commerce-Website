import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SummerSaleBanner extends StatelessWidget {
  const SummerSaleBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black, // Dark background
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Big Summer',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 32,
              fontWeight: FontWeight.w300,
            ),
          ),
          const Text(
            'Sale',
            style: TextStyle(
              color: Colors.white,
              fontSize: 64,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Commodo fames vitae vitae leo mauris in. Eu consequat.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 14),
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
            child: const Text('Shop Now'),
          ),
        ],
      ),
    );
  }
}
