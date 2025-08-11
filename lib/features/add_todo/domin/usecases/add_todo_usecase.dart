import 'package:todo_clean/features/add_todo/domin/repositories/add_todo_repository.dart';

import '../../../../core/entities/todo_entity.dart';


class AddTodoUseCase {
  final AddTodoRepository repository;
  AddTodoUseCase(this.repository);

  Future<void> call(TodoEntity todo) => repository.addTodo(todo);
}
