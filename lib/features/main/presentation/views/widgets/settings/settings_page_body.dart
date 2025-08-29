import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/auth/presentation/views/login_view.dart';
import 'package:graph/features/main/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:graph/features/main/presentation/views/widgets/settings/change_password_sec.dart';
import '../../../../../../core/services/get_it_service.dart';
import '../../../../../../core/services/providers/local_provider.dart';
import '../../../../../../core/services/providers/theme_provider.dart';
import '../../../../../../core/utils/appAssets.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../data/local_data_source/settings_local_data_source.dart';
import '../../../../../profile/presentation/views/edit_profile_view.dart';
import 'divide_line.dart';
import 'settings_row.dart';
import '../../../../../../generated/l10n.dart';
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
            onPressed: () {
              Navigator.pushNamed(context, ChangePasswordSec.name);
            },
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
          BlocListener<LogoutCubit, LogoutState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                //  AuthLocalDataSource.clear();

                Navigator.pushNamed(context, LoginView.name);
              } else if (state is LogoutError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: SettingsRow(
              text: lang.logout,
              icon: Assets.iconsExit,
              onPressed: () {
                context.read<LogoutCubit>().logout();
              },
            ),
          ),
        ],
      ),
    );
  }
}
