import 'package:flutter/material.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/services/providers/local_provider.dart';
import 'package:graph/core/services/providers/theme_provider.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/main/data/local_data_source/settings_local_data_source.dart';
import 'package:graph/features/profile/presentation/views/edit_profile_view.dart';
import 'package:graph/features/main/presentation/views/widgets/settings/divide_line.dart';
import 'package:graph/features/main/presentation/views/widgets/settings/settings_row.dart';
import 'package:graph/generated/l10n.dart';
import 'package:provider/provider.dart';

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({super.key});

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  final SettingsLocalDataSource settingsLocalDataSource =
      getIt<SettingsLocalDataSource>();
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lang.settings, style: AppTextStyle.cairoSemiBold24),
          SizedBox(height: 8),
          DividLine(text: lang.managementAndPrivacy),
          SizedBox(height: 8),
          SettingsRow(
            text: lang.changeNameAndPassowrd,
            icon: Assets.iconsKey,
            onPressed: () {},
          ),
          SettingsRow(
            text: lang.editProfile,
            icon: Assets.iconsUserGear,
            onPressed: () {
              Navigator.pushNamed(context, EditProfileView.name);
            },
          ),
          SettingsRow(
            text: lang.changeEmail,
            icon: Assets.iconsPasswordEmail,
            onPressed: () {},
          ),
          SettingsRow(
            text: lang.postsManagement,
            icon: Assets.iconsSettingsWindow,
            onPressed: () {},
          ),
          DividLine(text: lang.settings),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingsRow(
                text: lang.darkMode,
                icon: Assets.iconsMoon,
                onPressed: () {
                  final themeProvider = Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  );
                  themeProvider.toggleTheme(
                    themeProvider.themeMode == ThemeMode.dark,
                  );
                },
              ),
              Consumer<ThemeProvider>(
                builder: (context, themeProvider, _) {
                  return Switch(
                    value: themeProvider.themeMode == ThemeMode.dark,
                    onChanged: (bool value) {
                      themeProvider.toggleTheme(value);
                      settingsLocalDataSource.setDarkMode(value);
                    },
                    activeColor: Constants2.primaryColor(context),
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingsRow(
                text: lang.changeLanguage,
                icon: Assets.iconsChangeLanguage,
                onPressed: () {
                  final localProvider = Provider.of<LocalProvider>(
                    context,
                    listen: false,
                  );
                  final currentLang = localProvider.locale.languageCode;
                  if (currentLang == 'en') {
                    localProvider.setLocal('ar');
                  } else {
                    localProvider.setLocal('en');
                  }
                },
              ),
              Consumer<LocalProvider>(
                builder: (context, provider, _) {
                  final isEnglish = provider.locale.languageCode == 'en';
                  return Text(
                    isEnglish ? 'Eng' : 'عربي',
                    style: AppTextStyle.cairoRegular16,
                  );
                },
              ),
            ],
          ),
          SettingsRow(
            text: lang.logout,
            icon: Assets.iconsExit,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
