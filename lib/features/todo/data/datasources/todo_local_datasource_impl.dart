import 'package:hive/hive.dart';
import '../models/todo_model.dart';
import 'todo_local_datasource.dart';

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Box<TodoModel> box;

  TodoLocalDataSourceImpl(this.box);

  @override
  Future<void> addTodo(TodoModel todo) async {
    await box.put(todo.id, todo);
  }

  @override
  Future<List<TodoModel>> getTodos() async {
    return box.values.toList();
  }
}
