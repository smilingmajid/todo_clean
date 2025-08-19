import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_clean/controller/theme_controller.dart';
import 'package:todo_clean/features/project/data/models/project_model.dart';

import '../features/add_todo/data/datasource/todo_local_datasource.dart'
    as add_ds;
import '../features/add_todo/data/models/todo_model.dart';

import '../features/add_todo/data/repository/add_todo_repository_impl.dart';
import '../features/add_todo/domin/usecases/add_todo_usecase.dart';
import '../features/add_todo/presentation/controllers/add_todo_controller.dart';

import '../features/project/data/datasources/project_local_datasource.dart';
import '../features/project/data/repositories/project_repository_impl.dart';
import '../features/project/domin/usecase/add_project_usecase.dart';
import '../features/show_todo/data/datasources/todo_local_datasource.dart'
    as show_ds;
import '../features/show_todo/data/repositories/show_todo_repository_impl.dart';
import '../features/show_todo/domin/usecases/get_todos_usecase.dart';
import '../features/show_todo/presentation/controllers/show_todo_controller.dart';

class FeatureBinding extends Bindings {
  @override
  void dependencies() {
    final box = Hive.box<TodoModel>('todos');

    final addLocal = add_ds.TodoLocalDataSourceImpl(box);
    final showLocal = show_ds.TodoLocalDataSourceImpl(box);
   final boxx = Hive.box<ProjectModel>('projects');
    final local = ProjectLocalDataSourceImpl(boxx);
    final repository = ProjectRepositoryImpl(local);
    final usecase = AddProjectUseCase(repository);
    Get.put(HomeController(usecase));
    Get.lazyPut(
      () => AddTodoController(AddTodoUseCase(AddTodoRepositoryImpl(addLocal))),
      fenix: true,
    );

    Get.lazyPut(
      () => ShowTodoController(
        GetTodosUseCase(ShowTodoRepositoryImpl(showLocal)),
      ),
      fenix: true,
    );

    Get.lazyPut(() => ThemeController(), fenix: true);
  }
}
