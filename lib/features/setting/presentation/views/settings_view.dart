

import 'package:flutter/material.dart';

import 'package:graph/features/setting/presentation/views/widgets/settings_page_body.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const name = 'settings';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SettingsPageBody()));
  }
}
