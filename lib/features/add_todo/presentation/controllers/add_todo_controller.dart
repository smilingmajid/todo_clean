import 'package:get/get.dart';
import '../../domin/entities/todo_entity.dart';
import '../../domin/usecases/add_todo_usecase.dart';


class AddTodoController extends GetxController {
  final AddTodoUseCase addTodoUseCase;
  AddTodoController(this.addTodoUseCase);

  Future<void> addTodo(String title) async {
    final todo = TodoEntity(id: DateTime.now().toString(), title: title);
    await addTodoUseCase(todo);
    Get.back();
  }
}
