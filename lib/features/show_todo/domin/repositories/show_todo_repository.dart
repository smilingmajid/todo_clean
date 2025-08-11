import '../../../../core/entities/todo_entity.dart';

abstract class ShowTodoRepository {
  Future<List<TodoEntity>> getTodos();
}
