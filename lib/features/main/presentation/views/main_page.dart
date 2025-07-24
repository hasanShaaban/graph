import 'package:flutter/material.dart';
import 'package:graph/features/main/presentation/views/widgets/home/home_page_body.dart';
import 'package:graph/features/main/presentation/views/widgets/main_floating_action_button.dart';
import 'package:graph/features/main/presentation/views/widgets/main_navigation_bar.dart';
import 'package:graph/features/setting/presentation/views/widgets/settings_page_body.dart';
import 'package:graph/generated/l10n.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const name = 'mainPage';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  var selected = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: MainFloatingActionButton(width: width),
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              selected = value;
            });
          },
          controller: controller,
          children: [
            HomePageBody(width: width, height: height, lang: lang),
            Center(child: Text('Notifications')),
            SettingsPageBody(),
            Center(child: Text('Search')),
          ],
        ),
        bottomNavigationBar: MainNavigationBar(
          lang: lang,
          onTap: (index) {
            setState(() {
              selected = index;
              controller.jumpToPage(index);
            });
          },
          selected: selected,
        ),
      ),
    );
  }
}
