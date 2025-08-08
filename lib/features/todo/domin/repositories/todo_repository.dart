import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<void> addTodo(TodoEntity todo);
  Future<List<TodoEntity>> getTodos();
}
