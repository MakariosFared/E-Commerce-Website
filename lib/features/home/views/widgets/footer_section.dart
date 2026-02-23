import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Very dark background
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'cyber',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'We are a residential interior design firm located in Portland. Our boutique-studio offers more than',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54, fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 32),
          const _FooterLink(text: 'Services'),
          const _FooterLink(text: 'Bonus program'),
          const _FooterLink(text: 'Gift cards'),
          const _FooterLink(text: 'Credit and payment'),
          const _FooterLink(text: 'Terms of delivery'),
          const _FooterLink(text: 'Payment delivery'),
          const _FooterLink(text: 'Guarantee'),
          const _FooterLink(text: 'Frequently asked questions'),
          const _FooterLink(text: 'Terms of use of the site'),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.camera_alt), // Instagram placeholder
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.facebook),
              const SizedBox(width: 16),
              _buildSocialIcon(
                Icons.video_collection_outlined,
              ), // Tiktok placeholder
              const SizedBox(width: 16),
              _buildSocialIcon(Icons.flutter_dash), // Twitter placeholder
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white12,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
