import 'package:get/get.dart';
import 'en_us.dart';
import 'de_de.dart';
import 'fa_ir.dart';
import 'ar_sa.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'de_DE': deDE,
        'fa_IR': faIR,
        'ar_SA': arSA,
      };
}
