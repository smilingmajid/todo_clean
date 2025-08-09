import 'package:get/get.dart';

import '../../data/datasources/todo_local_datasource_impl.dart';
import '../../data/models/todo_model.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domin/usecases/add_todo_usecase.dart';
import '../controllers/todo_controller.dart';
import 'package:hive/hive.dart';


class TodoBinding extends Bindings {
  @override
  void dependencies() {
    final box = Hive.box<TodoModel>('todos');
    final datasource = TodoLocalDataSourceImpl(box);
    final repo = TodoRepositoryImpl(datasource);
    final usecase = AddTodoUseCase(repo);
    Get.lazyPut(() => TodoController(usecase));
  }
}

