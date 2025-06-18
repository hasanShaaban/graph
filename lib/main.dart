import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graph/bloc_providers.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:graph/features/splash/presentation/views/splash_view.dart';
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
  setupGetit();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocalProvider()..loadLocale(),
        ),
        ChangeNotifierProvider(create: (context) => UserInfoProvider()),
      ],
      child: MyApp(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => LocalProvider()..loadLocale(),
    //   child: MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LocalProvider>(context);
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
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Constants.lightPrimaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Constants.primaryColor),
          fontFamily: 'Cairo',
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
         initialRoute: SplashView.name,
       // initialRoute: GroupsManagementView.name,
      ),
    );
  }
}
