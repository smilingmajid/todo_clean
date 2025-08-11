import 'package:get/get.dart';
import '../../../../core/entities/todo_entity.dart';
import '../../domin/usecases/get_todos_usecase.dart';

class ShowTodoController extends GetxController {
  final GetTodosUseCase getTodosUseCase;
  var todos = <TodoEntity>[].obs;

  ShowTodoController(this.getTodosUseCase);

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    todos.value = await getTodosUseCase();
  }
}
