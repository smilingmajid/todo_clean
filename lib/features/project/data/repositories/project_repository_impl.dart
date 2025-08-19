import '../datasources/project_local_datasource.dart';
import '../models/project_model.dart';

abstract class ProjectRepository {
  Future<void> addProject(ProjectModel project);
  Future<List<ProjectModel>> getProjects();
}

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectLocalDataSource localDataSource;
  ProjectRepositoryImpl(this.localDataSource);

  @override
  Future<void> addProject(ProjectModel project) async {
    await localDataSource.addProject(project);
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    return await localDataSource.getProjects();
  }
}
