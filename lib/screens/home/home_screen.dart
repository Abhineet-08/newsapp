import 'package:flutter/material.dart';
import 'package:newsapp/widgets/home/news_tile.dart';
import 'package:newsapp/widgets/home/trending_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      TrendingCard(
                        width: getCardWidth(context),
                        imageUrl:
                            "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                        title: "Is ut working",
                        tag: "few days",
                        time: "1 days ago",
                        author: "Abhineet",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                const Column(
                  children: [
                    NewsTile(
                      imageUrl:
                          "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                      time: "2days ago",
                      title:
                          "Heading HeadingHe adingHeadingHe adingHeadingHead ingHeadingHead ingHeading HeadingHeadingHeadingHeading",
                      author: "Abhineet",
                    ),
                    NewsTile(
                      imageUrl:
                          "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                      time: "2days ago",
                      title:
                          "Heading HeadingHe adingHeadingHe adingHeadingHead ingHeadingHead ingHeading HeadingHeadingHeadingHeading",
                      author: "Abhineet",
                    ),
                    NewsTile(
                      imageUrl:
                          "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg",
                      time: "2days ago",
                      title:
                          "Heading HeadingHe adingHeadingHe adingHeadingHead ingHeadingHead ingHeading HeadingHeadingHeadingHeading",
                      author: "Abhineet",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }

  double getCardWidth(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return width / 1.5;
    } else if (width < 1200) {
      return width / 3; // More comfortable for laptops
    } else {
      return width / 4;
    }
  }

}
