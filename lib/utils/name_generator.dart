import 'package:app/i18n/strings.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:unique_name_generator/unique_name_generator.dart';

class NameGenerator {
  static String generate(BuildContext context) {
    var dictionaries = [
      ListDictionary(context.t.name_generator.adjectives),
      ListDictionary(context.t.name_generator.animals)
    ];
    //get user locale
    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode == 'fr') {
      dictionaries = dictionaries.reversed.toList();
    }
    var generator = UniqueNameGenerator(
      dictionaries: dictionaries,
      style: NameStyle.capital,
      separator: ' ',
    );
    return generator.generate();
  }
}
