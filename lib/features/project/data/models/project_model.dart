import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 1)
class ProjectModel extends HiveObject {
  @HiveField(0)
  final String name;

  ProjectModel(this.name);
}
