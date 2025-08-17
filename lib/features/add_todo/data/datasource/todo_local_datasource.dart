import 'package:hive/hive.dart';
import '../models/todo_model.dart';

abstract class TodoLocalDataSource {
  Future<void> addTodoModel(TodoModel todo);
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Box<TodoModel> box;

  TodoLocalDataSourceImpl(this.box);

  @override
  Future<void> addTodoModel(TodoModel todo) async {
    await box.put(todo.id, todo);
  }
}
