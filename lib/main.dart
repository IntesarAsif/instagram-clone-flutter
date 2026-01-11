import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/util/app_constants.dart';
import 'package:instagram_clone/helper/app_translations.dart';
import 'package:instagram_clone/helper/route_helper.dart';

import 'helper/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languages = await di.init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});

  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    final Locale fallbackLocale = Locale(
      AppConstants.languages.first.languageCode,
      AppConstants.languages.first.countryCode,
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)),
      initialRoute: RouteHelper.getHomeRoute(),
      getPages: RouteHelper.routes,
      translations: Messages(languages: languages),
      locale: fallbackLocale,
      fallbackLocale: fallbackLocale,
    );
  }
}
