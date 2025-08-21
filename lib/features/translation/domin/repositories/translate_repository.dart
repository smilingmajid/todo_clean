import '../entities/language.dart';

abstract class TranslateRepository {
  Future<Language> getCurrentLanguage();
  Future<void> changeLanguage(Language language);
}
