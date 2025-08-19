import '../../data/models/project_model.dart';
import '../../data/repositories/project_repository_impl.dart';

class AddProjectUseCase {
  final ProjectRepository repository;
  AddProjectUseCase(this.repository);

  Future<void> call(ProjectModel project) async {
    await repository.addProject(project);
  }
}
