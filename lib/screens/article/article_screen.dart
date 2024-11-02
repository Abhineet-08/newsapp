import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/news_controller.dart';
import 'package:newsapp/screens/details/news_detail_screen.dart';
import 'package:newsapp/widgets/home/news_tile.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());

    // Track the selected category
    String? selectedCategory;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 15),
                    _buildCategoryButton(
                      context,
                      label: 'Business',
                      isSelected: selectedCategory == 'business',
                      onTap: () {
                        if (selectedCategory == 'business') {
                          selectedCategory = null; // Reset selection
                          newsController.filterByCategory(''); // Show all if reset
                        } else {
                          selectedCategory = 'business';
                          newsController.filterByCategory('business');
                        }
                      },
                    ),
                    const SizedBox(width: 15),
                    _buildCategoryButton(
                      context,
                      label: 'Technology',
                      isSelected: selectedCategory == 'tesla',
                      onTap: () {
                        if (selectedCategory == 'tesla') {
                          selectedCategory = null; // Reset selection
                          newsController.filterByCategory(''); // Show all if reset
                        } else {
                          selectedCategory = 'tesla';
                          newsController.filterByCategory('tesla');
                        }
                      },
                    ),
                    const SizedBox(width: 15),
                    _buildCategoryButton(
                      context,
                      label: 'Politics',
                      isSelected: selectedCategory == 'apple',
                      onTap: () {
                        if (selectedCategory == 'apple') {
                          selectedCategory = null; // Reset selection
                          newsController.filterByCategory(''); // Show all if reset
                        } else {
                          selectedCategory = 'apple';
                          newsController.filterByCategory('apple');
                        }
                      },
                    ),
                    const SizedBox(width: 15),
                    _buildCategoryButton(
                      context,
                      label: 'Trending',
                      isSelected: selectedCategory == 'trending',
                      onTap: () {
                        if (selectedCategory == 'trending') {
                          selectedCategory = null; // Reset selection
                          newsController.filterByCategory(''); // Show all if reset
                        } else {
                          selectedCategory = 'trending';
                          newsController.filterByCategory('trending');
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  if (newsController.filteredNewsList.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: newsController.filteredNewsList
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
                      ),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected
              ? Colors.blue // Change background color when selected
              : Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, // Change text color when selected
          ),
        ),
      ),
    );
  }
}
