import '../repositories/project_repository.dart';
import '../../data/models/project_model.dart';

class DeleteProjectUseCase {
  final ProjectRepository repository;

  DeleteProjectUseCase(this.repository);

  Future<void> call(ProjectModel project) async {
    await repository.deleteProject(project);
  }
}
