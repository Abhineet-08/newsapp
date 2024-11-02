import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/modals/news_modal.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModal news;

  const NewsDetailScreen({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Row(
                            children: [
                              Icon(Icons.arrow_back_ios),
                              Text('back'),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 330,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                news.urlToImage ??
                                    "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                      child:
                                          Icon(Icons.broken_image, size: 50));
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      news.title ?? "No Title Available",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          news.publishedAt ?? "Date Unavailable",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text((news.author?.isNotEmpty ?? false)
                              ? news.author![0]
                              : "N"),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          news.author ?? "Unknown Author",
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Obx(
                            () => newsController.isSpeaking.value
                                ? IconButton(
                                    onPressed: () {
                                      newsController.stop();
                                    },
                                    icon: const Icon(
                                      Icons.stop_rounded,
                                      size: 50,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      newsController.speak(
                                          news.description ?? "No Description");
                                    },
                                    icon: const Icon(
                                      Icons.play_arrow_rounded,
                                      size: 50,
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: Lottie.asset(
                              'assets/animation/audiowaves.json',
                              height: 70,
                              animate: newsController.isSpeaking.value,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            news.description ?? "Description not available.",
                            style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
