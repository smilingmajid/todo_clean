
import '../../domin/entities/todo_entity.dart';
import '../../domin/repositories/todo_repository.dart';
import '../datasources/todo_local_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<void> addTodo(TodoEntity todo) async {
    final model = TodoModel.fromEntity(todo);
    await localDataSource.addTodo(model);
  }

  @override
  Future<List<TodoEntity>> getTodos() async {
    return await localDataSource.getTodos();
  }
}
