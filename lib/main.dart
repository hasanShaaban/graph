import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graph/core/services/providers/theme_provider.dart';
import 'package:graph/features/auth/presentation/views/sign_up_view.dart';
import 'package:graph/features/profile/presentation/views/profile_view.dart';
import 'bloc_providers.dart';
import 'core/services/providers/user_info_provider.dart';
import 'core/services/providers/local_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/functions/on_generate_route.dart';
import 'core/services/get_it_service.dart';
import 'core/utils/constants.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('authBox');
  setupGetit();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocalProvider()..loadLocale(),
        ),
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LocalProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        supportedLocales: S.delegate.supportedLocales,
        locale: languageProvider.locale,

        themeMode: themeProvider.themeMode,
        darkTheme: ThemeData.dark(useMaterial3: false),
        
        theme: ThemeData(
          useMaterial3: false,
          
          scaffoldBackgroundColor: Constants2.lightPrimaryColor(context),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Constants2.primaryColor(context),
          ),
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        //initialRoute: SplashView.name,
        initialRoute: ProfileView.name,
         //initialRoute: SignUpView.name,
      ),
    );
  }
}
