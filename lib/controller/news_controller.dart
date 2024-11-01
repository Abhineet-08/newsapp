import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:newsapp/modals/news_modal.dart';

class NewsController extends GetxController {
  RxList<NewsModal> trendingNewsList = <NewsModal>[].obs;
  RxList<NewsModal> totalNewsList = <NewsModal>[].obs;
  RxList<NewsModal> limitedTotalNewsList = <NewsModal>[].obs;
  RxList<NewsModal> totalTeslaNewsList = <NewsModal>[].obs;
  RxList<NewsModal> limitedTotalTeslaNewsList = <NewsModal>[].obs;
  RxList<NewsModal> totalAppleNewsList = <NewsModal>[].obs;
  RxList<NewsModal> limitedTotalAppleNewsList = <NewsModal>[].obs;
  RxList<NewsModal> combinedNewsList = <NewsModal>[].obs;
  RxList<NewsModal> limitedCombinedNewsList = <NewsModal>[].obs;
  RxList<NewsModal> filteredNewsList = <NewsModal>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTrendingNews();
    getNewsTotal();
    getNewsApple();
    getNewsTesla();
  }

  Future<void> getTrendingNews() async {
    const baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=75daff2d8b3d42f39f56dd53aed38421";

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body["articles"];

        trendingNewsList.clear();
        combinedNewsList.clear();

        for (var news in articles) {
          trendingNewsList.add(NewsModal.fromJson(news));
          combinedNewsList.add(NewsModal.fromJson(news));
        }
        // Limit combined news list to the first 10 items
        updateLimitedCombinedList();
      } else {
        print("Failed to fetch trending news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching trending news: $e");
    }
  }

  Future<void> getNewsTotal() async {
    const baseUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=75daff2d8b3d42f39f56dd53aed38421";

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body["articles"];

        totalNewsList.clear();

        for (var news in articles) {
          totalNewsList.add(NewsModal.fromJson(news));
          combinedNewsList.add(NewsModal.fromJson(news));
        }
        // Limit combined news list to the first 10 items
        updateLimitedCombinedList();
      } else {
        print("Failed to fetch total news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching total news: $e");
    }
  }

  Future<void> getNewsTesla() async {
    const baseUrl = "https://newsapi.org/v2/everything?q=tesla&from=2024-09-30&sortBy=publishedAt&apiKey=75daff2d8b3d42f39f56dd53aed38421";

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body["articles"];

        totalTeslaNewsList.clear();

        for (var news in articles) {
          totalTeslaNewsList.add(NewsModal.fromJson(news));
          combinedNewsList.add(NewsModal.fromJson(news));
        }
        // Limit combined news list to the first 10 items
        updateLimitedCombinedList();
      } else {
        print("Failed to fetch Tesla news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching Tesla news: $e");
    }
  }

  Future<void> getNewsApple() async {
    const baseUrl = "https://newsapi.org/v2/everything?q=apple&from=2024-10-30&to=2024-10-30&sortBy=popularity&apiKey=75daff2d8b3d42f39f56dd53aed38421";

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body["articles"];

        totalAppleNewsList.clear();

        for (var news in articles) {
          totalAppleNewsList.add(NewsModal.fromJson(news));
          combinedNewsList.add(NewsModal.fromJson(news));
        }
        // Limit combined news list to the first 10 items
        updateLimitedCombinedList();
      } else {
        print("Failed to fetch Apple news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching Apple news: $e");
    }
  }

  void updateLimitedCombinedList() {
    // Update the limitedCombinedNewsList to the first 10 items
    limitedCombinedNewsList.value = combinedNewsList.sublist(0,10).obs;
  }

  void filterByCategory(String category) {
    switch (category) {
      case 'business':
        filteredNewsList.value = totalNewsList;
        break;
      case 'tesla':
        filteredNewsList.value = totalTeslaNewsList;
        break;
      case 'apple':
        filteredNewsList.value = totalAppleNewsList;
        break;
      case 'trending':
        filteredNewsList.value = trendingNewsList;
        break;
      default:
        filteredNewsList.value = combinedNewsList; // Show all if no category matches
    }
  }
}
