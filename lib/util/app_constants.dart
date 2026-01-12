import 'package:instagram_clone/features/language/domain/models/language_model.dart';

class AppConstants {    ///flutter version 3.28.3
  static const String appName = 'Instagram Clone';
  static const String fontFamily = 'Roboto';

  static const List<LanguageModel> languages = [
    LanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(languageName: 'Espanol', countryCode: 'ES', languageCode: 'es'),
  ];
}
