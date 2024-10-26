import 'package:get/get.dart';
import 'package:newsapp/screens/article/article_screen.dart';
import 'package:newsapp/screens/home/home_screen.dart';
import 'package:newsapp/screens/settings/settings_screen.dart';

class BottomNavController extends GetxController {

  RxInt index = 0.obs;
  var screens = [
    const HomeScreen(),
    const ArticleScreen(),
    const SettingsScreen()
  ];
}