import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../features/add_todo/data/datasource/todo_local_datasource.dart' as add_ds;
import '../features/add_todo/data/models/todo_model.dart';

import '../features/add_todo/data/repository/add_todo_repository_impl.dart';
import '../features/add_todo/domin/usecases/add_todo_usecase.dart';
import '../features/add_todo/presentation/controllers/add_todo_controller.dart';


import '../features/show_todo/data/datasources/todo_local_datasource.dart' as show_ds;
import '../features/show_todo/data/repositories/show_todo_repository_impl.dart';
import '../features/show_todo/domin/usecases/get_todos_usecase.dart';
import '../features/show_todo/presentation/controllers/show_todo_controller.dart';

class FeatureBinding extends Bindings {
  @override
  void dependencies() {
    final box = Hive.box<TodoModel>('todos');

    final addLocal = add_ds.TodoLocalDataSourceImpl(box);   
    final showLocal = show_ds.TodoLocalDataSourceImpl(box);

    Get.lazyPut(
      () => AddTodoController(AddTodoUseCase(AddTodoRepositoryImpl(addLocal))),
    );

    Get.lazyPut(
      () => ShowTodoController(
        GetTodosUseCase(ShowTodoRepositoryImpl(showLocal)),
      ),
    );
  }
}
