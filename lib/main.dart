import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'di/feature_binding.dart';
import 'package:todo_clean/features/home/presentation/page/home_page.dart';
import 'core/translations/app_translations.dart';
import 'features/add_todo/data/models/todo_model.dart';
import 'core/theme/theme_service.dart';
import 'features/project/data/models/project_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');
  await Hive.openBox('themeBox');
  final themeService = ThemeService();
    Hive.registerAdapter(ProjectModelAdapter());
  await Hive.openBox<ProjectModel>('projects');


  runApp(
    GetMaterialApp(
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: await themeService.loadTheme() ? ThemeMode.dark : ThemeMode.light,
      initialBinding: FeatureBinding(),
      home: HomePage(),
    ),
  );
}
