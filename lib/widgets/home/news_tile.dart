import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;

  const NewsTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: againGetCardWidth(context),
              height: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 10),
                      Text(author),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double againGetCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width / 2;
    } else if (width < 1200) {
      return width / 3.5; // More comfortable for laptops
    } else {
      return width / 5;
    }
  }
}
