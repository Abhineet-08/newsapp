import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final double width;
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;

  const TrendingCard({
    required this.width,
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 310,
      width: width,
      // Use the passed width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tag,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  author,
                  style: Theme.of(context).textTheme.labelSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
