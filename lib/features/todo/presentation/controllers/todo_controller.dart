import 'package:get/get.dart';

import '../../domin/entities/todo_entity.dart';
import '../../domin/usecases/add_todo_usecase.dart';

class TodoController extends GetxController {
  final AddTodoUseCase addTodoUseCase;

  TodoController(this.addTodoUseCase);

  RxList<TodoEntity> todos = <TodoEntity>[].obs;

  void addTodo(String title) {
    final todo = TodoEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    addTodoUseCase.call(todo);
    todos.add(todo);
  }
}
