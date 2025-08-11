import 'package:hive/hive.dart';

import '../../../add_todo/data/models/todo_model.dart';


abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodoModels();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  final Box<TodoModel> box;

  TodoLocalDataSourceImpl(this.box);

  @override
  Future<List<TodoModel>> getTodoModels() async {
    return box.values.toList();
  }
}
