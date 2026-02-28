import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews', style: AppTypography.h3),
            TextButton(onPressed: () {}, child: const Text('View All')),
          ],
        ),
        const SizedBox(height: 16),
        _buildRatingOverview(),
        const SizedBox(height: 24),
        _buildReviewItem(
          name: 'Jane Cooper',
          date: 'Feb 12, 2024',
          rating: 5,
          comment:
              'The camera is absolutely stunning. Dynamic Island is actually much more useful than I thought!',
          avatar:
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100&h=100&fit=crop',
        ),
        const Divider(height: 32),
        _buildReviewItem(
          name: 'Ronald Richards',
          date: 'Jan 28, 2024',
          rating: 4,
          comment:
              'Great phone, but the battery life could be better with heavy use.',
          avatar:
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop',
          images: [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6-6R87m52N38kI5-K0YjI-K0YjI',
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6-6R87m52N38kI5-K0YjI-K0YjI',
          ],
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Write a review',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRatingOverview() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '4.8',
                style: AppTypography.h1.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '422 reviews',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              children: [
                _buildRatingBar(5, 0.8),
                _buildRatingBar(4, 0.15),
                _buildRatingBar(3, 0.03),
                _buildRatingBar(2, 0.01),
                _buildRatingBar(1, 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingBar(int stars, double percent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$stars',
            style: AppTypography.bodySmall.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: AppColors.divider,
                color: Colors.amber,
                minHeight: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem({
    required String name,
    required String date,
    required double rating,
    required String comment,
    required String avatar,
    List<String>? images,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.background,
              backgroundImage: NetworkImage(avatar),
              onBackgroundImageError: (exception, stackTrace) {},
              child: const Icon(Icons.person, size: 20, color: Colors.grey),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date,
                    style: AppTypography.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: index < rating ? Colors.amber : Colors.grey[300],
                  size: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(comment, style: AppTypography.bodyMedium),
        if (images != null) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  images[index],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: AppColors.background,
                    child: const Icon(Icons.image_outlined, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
