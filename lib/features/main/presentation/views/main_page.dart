import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import 'widgets/home/home_page_body.dart';
import 'widgets/main_floating_action_button.dart';
import 'widgets/main_navigation_bar.dart';
import 'widgets/settings/settings_page_body.dart';
import '../../../../generated/l10n.dart';


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
        backgroundColor: Constants2.lightPrimaryColor(context),
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
