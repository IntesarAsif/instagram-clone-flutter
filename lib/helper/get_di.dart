import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/features/home/controllers/home_controller.dart';
import 'package:instagram_clone/features/home/domain/repositories/home_repository.dart';
import 'package:instagram_clone/features/profile/controllers/profile_controller.dart';
import 'package:instagram_clone/features/profile/domain/repositories/profile_repository.dart';
import 'package:instagram_clone/util/app_constants.dart';
import 'package:instagram_clone/features/language/domain/models/language_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.put(HomeRepository(), permanent: true);
  Get.lazyPut(() => HomeController(homeRepository: Get.find<HomeRepository>()), fenix: true);
  Get.put(ProfileRepository(), permanent: true);
  Get.lazyPut(() => ProfileController(profileRepository: Get.find<ProfileRepository>()), fenix: true);

  final Map<String, Map<String, String>> languages = {};
  for (final LanguageModel languageModel in AppConstants.languages) {
    final String jsonStringValues = await rootBundle.loadString('assets/language/${languageModel.languageCode}.json');
    final Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    final Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] = json;
  }
  return languages;
}
