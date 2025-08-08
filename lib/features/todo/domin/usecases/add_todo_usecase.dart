import '../entities/todo_entity.dart';
import '../repositories/todo_repository.dart';

class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase(this.repository);

  Future<void> call(TodoEntity todo) async {
    await repository.addTodo(todo);
  }
}
