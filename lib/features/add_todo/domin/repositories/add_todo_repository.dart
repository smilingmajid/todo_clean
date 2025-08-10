import '../entities/todo_entity.dart';

abstract class AddTodoRepository {
  Future<void> addTodo(TodoEntity todo);
}
