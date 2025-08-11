import '../../../../core/entities/todo_entity.dart';

import '../../domin/repositories/show_todo_repository.dart';
import '../datasources/todo_local_datasource.dart';

class ShowTodoRepositoryImpl implements ShowTodoRepository {
  final TodoLocalDataSource local;

  ShowTodoRepositoryImpl(this.local);

  @override
  Future<List<TodoEntity>> getTodos() async {
    final models = await local.getTodoModels();
    return models.map((m) => m.toEntity()).toList();
  }
}
