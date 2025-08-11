import '../../../../core/entities/todo_entity.dart';
import '../repositories/show_todo_repository.dart';

class GetTodosUseCase {
  final ShowTodoRepository repository;
  GetTodosUseCase(this.repository);

  Future<List<TodoEntity>> call() => repository.getTodos();
}
