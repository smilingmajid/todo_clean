import 'package:get/get.dart';
import '../../../project/data/models/project_model.dart';
import '../../../project/domin/usecase/add_project_usecase.dart';
import '../../../project/domin/usecase/delete_project_usecase.dart';
import 'package:todo_clean/core/theme/project_colors.dart';

class HomeController extends GetxController {
  final AddProjectUseCase addProjectUseCase;
  final DeleteProjectUseCase deleteProjectUseCase;

  HomeController(this.addProjectUseCase, this.deleteProjectUseCase);

  var projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void addProject(String name) async {
    int count = projects.length;
    final project = ProjectModel(
      name: name,
      // ignore: deprecated_member_use
      colorValue:
          // ignore: deprecated_member_use
          ProjectColors.palette[count % ProjectColors.palette.length].value,
    );
    await addProjectUseCase(project);
    projects.add(project);
  }

  void deleteProject(int index) async {
    final project = projects[index];
    await deleteProjectUseCase(project);
    projects.removeAt(index);
  }

  void loadProjects() async {
    projects.clear();
    final list = await addProjectUseCase.repository.getProjects();
    projects.addAll(list);
  }
}
