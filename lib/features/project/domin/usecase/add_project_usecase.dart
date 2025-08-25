import '../../data/models/project_model.dart';

import '../repositories/project_repository.dart';

class AddProjectUseCase {
  final ProjectRepository repository;
  AddProjectUseCase(this.repository);

  Future<void> call(ProjectModel project) async {
    await repository.addProject(project);
  }
}
