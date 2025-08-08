// ignore_for_file: overridden_fields

import 'package:hive/hive.dart';

import '../../domin/entities/todo_entity.dart';


part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends TodoEntity {
  @override
  @HiveField(0)
  final String id;

  @override
  @HiveField(1)
  final String title;

  @override
  @HiveField(2)
  final bool isDone;

  TodoModel({required this.id, required this.title, this.isDone = false})
      : super(id: id, title: title, isDone: isDone);

  factory TodoModel.fromEntity(TodoEntity entity) =>
      TodoModel(id: entity.id, title: entity.title, isDone: entity.isDone);
}
