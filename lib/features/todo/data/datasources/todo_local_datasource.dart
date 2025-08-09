import '../models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<void> addTodo(TodoModel todo);
  Future<List<TodoModel>> getTodos();
}
