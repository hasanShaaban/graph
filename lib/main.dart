import 'package:flutter/material.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/functions/on_generate_route.dart';
import 'core/services/get_it_service.dart';
import 'core/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupGetit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Constants.lightPrimaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Constants.primaryColor),
        fontFamily: 'Cairo',
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
        initialRoute: SplashView.name,
     // initialRoute: FollowersView.name,
    );
  }
}
