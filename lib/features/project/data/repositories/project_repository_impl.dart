import '../../domin/repositories/project_repository.dart';
import '../models/project_model.dart';
import '../datasources/project_local_datasource.dart';

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

  @override
  Future<void> deleteProject(ProjectModel project) async {
    await localDataSource.deleteProject(project);
  }
}
