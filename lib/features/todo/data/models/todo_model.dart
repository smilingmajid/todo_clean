

import 'package:hive/hive.dart';

import '../../domin/entities/todo_entity.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends TodoEntity {
  @override
  @HiveField(0)
  // ignore: overridden_fields
  final String id;

  @override
  @HiveField(1)
  // ignore: overridden_fields
  final String title;

  @override
  @HiveField(2)
  // ignore: overridden_fields
  final bool isDone;

  TodoModel({required this.id, required this.title, this.isDone = false})
      : super(id: id, title: title, isDone: isDone);

  factory TodoModel.fromEntity(TodoEntity entity) =>
      TodoModel(id: entity.id, title: entity.title, isDone: entity.isDone);
}
