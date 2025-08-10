import '../models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<void> addTodoModel(TodoModel todo);
}
