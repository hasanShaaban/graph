import 'package:flutter/material.dart';
import 'package:graph/features/setting/presentation/views/widgets/bottom_app_bar_widget.dart';
import 'package:graph/features/setting/presentation/views/widgets/floating_action_button_widget.dart';

import 'package:graph/features/setting/presentation/views/widgets/settings_page_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const name = 'settings';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SettingsPageBody(),
        floatingActionButton: FloatngActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBarWidget(),
      ),
    );
  }
}
