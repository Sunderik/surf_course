import 'package:flutter/material.dart';
import 'package:task_279830/core/domain/enums/pages_enum.dart';
import 'package:task_279830/core/theme/extensions/color_extension.dart';
import 'package:task_279830/features/basket_screen/basket_screen.dart';
import 'package:task_279830/features/catalog_screen/catalog_screen.dart';
import 'package:task_279830/features/personal_screen/personal_screen.dart';
import 'package:task_279830/features/search_screen/search_screen.dart';

/// Базовая обертка приложения с настройками навигации
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// Контроллер для управления перемещения через нижнее меню навигации
  final PageController controller = PageController();

  /// Текущий открытый экран
  int currentIndex = 0;

  /// Массив экранов доступных для перемещения через нижнее меню навигации
  final tabPages = [
    const CatalogScreen(),
    const SearchScreen(),
    const BasketScreen(),
    const PersonalScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView(
        controller: controller,
        children: tabPages,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: Container(
        height: 83,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).colorScheme.customBorderColor,
              width: 1.0,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            controller.jumpToPage(index);
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(ScreensEnum.catalog.icon), label: ScreensEnum.catalog.name),
            BottomNavigationBarItem(icon: Icon(ScreensEnum.search.icon), label: ScreensEnum.search.name),
            BottomNavigationBarItem(icon: Icon(ScreensEnum.basket.icon), label: ScreensEnum.basket.name),
            BottomNavigationBarItem(icon: Icon(ScreensEnum.personal.icon), label: ScreensEnum.personal.name),
          ],
        ),
      ),
    );
  }
}
