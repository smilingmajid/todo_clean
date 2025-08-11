import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_clean/di/feature_binding.dart';
import 'features/add_todo/data/models/todo_model.dart';
import 'features/show_todo/presentation/pages/show_todo_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  await Hive.openBox<TodoModel>('todos');

  runApp(
    GetMaterialApp(
      initialBinding: FeatureBinding(),
      home: ShowTodoPage(),
    ),
  );
}
