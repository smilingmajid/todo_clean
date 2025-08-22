import 'package:get/get.dart';
import 'package:todo_clean/core/theme/project_colors.dart';
import '../../../project/data/models/project_model.dart';
import '../../../project/domin/usecase/add_project_usecase.dart';

class HomeController extends GetxController {
  final AddProjectUseCase addProjectUseCase;
  HomeController(this.addProjectUseCase);

  var projects = <ProjectModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProjects();
  }

  void addProject(
    String name, //, int count
  ) async {
    
    int count = projects.length;
    final project = ProjectModel(
      name: name,
      // ignore: deprecated_member_use
      colorValue: ProjectColors.palette[count].value,
    );
    await addProjectUseCase(project);
    projects.add(project);
  }

  void loadProjects() async {
    projects.clear();
    final list = await addProjectUseCase.repository.getProjects();
    projects.addAll(list);
  }
}
