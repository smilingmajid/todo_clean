import 'package:hive/hive.dart';
import '../models/project_model.dart';

abstract class ProjectLocalDataSource {
  Future<void> addProject(ProjectModel project);
  Future<List<ProjectModel>> getProjects();
  Future<void> deleteProject(ProjectModel project);
}

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
  final Box<ProjectModel> box;

  ProjectLocalDataSourceImpl(this.box);

  @override
  Future<void> addProject(ProjectModel project) async {
    await box.add(project);
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    return box.values.toList();
  }

  @override
  Future<void> deleteProject(ProjectModel project) async {
    await project.delete();
  }
}
