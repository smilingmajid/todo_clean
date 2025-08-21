import '../entities/language.dart';
import '../repositories/translate_repository.dart';

class GetCurrentLanguage {
  final TranslateRepository repository;
  GetCurrentLanguage(this.repository);

  Future<Language> call() async {
    return await repository.getCurrentLanguage();
  }
}
