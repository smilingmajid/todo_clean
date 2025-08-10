import '../../domin/entities/todo_entity.dart';
import '../../domin/repositories/add_todo_repository.dart';
import '../datasource/todo_local_datasource.dart';
import '../models/todo_model.dart';

class AddTodoRepositoryImpl implements AddTodoRepository {
  final TodoLocalDataSource local;

  AddTodoRepositoryImpl(this.local);

  @override
  Future<void> addTodo(TodoEntity todo) {
    final model = TodoModel.fromEntity(todo);
    return local.addTodoModel(model);
  }
}
