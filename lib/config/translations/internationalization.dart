import 'package:exquis8_hotel_app/utils/constants.dart';
import 'package:exquis8_hotel_app/utils/locale_database_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
import 'ar_AR/ar_ar_translation.dart';
import 'en_US/en_us_translation.dart';

class InternationalizationMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'ar_AR': arAR,
      };
}

class InternationalizationService {
  // default language

  // supported languages
  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'AR'),
  };

  /// update app language by code language for example (en,ar..etc)
  static updateLanguage(String languageCode) async {
    // update current language in shared pref
    LocaleDatabase().setData(Constants.lang, languageCode);

    await Get.updateLocale(supportedLanguages[languageCode]!);
  }

  /// check if the language is english
  static bool isItEnglish() =>
      (LocaleDatabase().getData(Constants.lang) ?? 'en') == 'en';

  /// get current locale
  static Locale getCurrentLocal() =>
      Locale(LocaleDatabase().getData(Constants.lang) ?? 'en');
}
