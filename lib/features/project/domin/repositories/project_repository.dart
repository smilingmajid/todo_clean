import '../../data/models/project_model.dart';

abstract class ProjectRepository {
  Future<void> addProject(ProjectModel project);
  Future<List<ProjectModel>> getProjects();
  Future<void> deleteProject(ProjectModel project);
}
