import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/screens/details/news_detail_screen.dart';
import 'package:newsapp/widgets/home/news_tile.dart';
import 'package:newsapp/widgets/home/trending_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    // Call getNewsTotal to populate totalNewsList
    newsController.getNewsTotal();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: const Icon(Icons.dashboard),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.surface,
                      ),
                      child: const Icon(Icons.person),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hottest News',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'see all',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(() {
                  if (newsController.trendingNewsList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: newsController.trendingNewsList
                            .map((news) => Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: TrendingCard(
                                    width: getCardWidth(context),
                                    onTap: () {
                                      Get.to(
                                        NewsDetailScreen(
                                          news: news,
                                        ),
                                      );
                                    },
                                    imageUrl: news.urlToImage ??
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                                    title: news.title ?? "No Title",
                                    tag: "few days",
                                    time: news.publishedAt ?? "Unknown Time",
                                    author: news.author ?? "Unknown",
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  }
                }),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News for you',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'see all',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Obx(() {
                  if (newsController.limitedCombinedNewsList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: newsController.limitedCombinedNewsList
                          .map((news) => NewsTile(
                                onTap: () {
                                  Get.to(
                                    NewsDetailScreen(
                                      news: news,
                                    ),
                                  );
                                },
                                imageUrl: news.urlToImage ??
                                    "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                                time: news.publishedAt ?? "Unknown Time",
                                title: news.title ?? "No Title",
                                author: news.author ?? "Unknown",
                              ))
                          .toList(),
                    );
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  double getCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width / 1.5;
    } else if (width < 1200) {
      return width / 3;
    } else {
      return width / 4;
    }
  }
}
