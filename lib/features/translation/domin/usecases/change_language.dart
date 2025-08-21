import '../entities/language.dart';
import '../repositories/translate_repository.dart';

class ChangeLanguage {
  final TranslateRepository repository;
  ChangeLanguage(this.repository);

  Future<void> call(Language language) async {
    return await repository.changeLanguage(language);
  }
}
