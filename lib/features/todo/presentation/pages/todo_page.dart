import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class TodoPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCtrl = Get.find<TodoController>();

    return Scaffold(
      appBar: AppBar(title: Text("My ToDos")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: controller),
          ),
          ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  todoCtrl.addTodo(controller.text);
                  controller.clear();
                }
              },
              child: Text("Add Todo")),
          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: todoCtrl.todos.length,
              itemBuilder: (context, index) {
                final todo = todoCtrl.todos[index];
                return ListTile(title: Text(todo.title));
              },
            )),
          ),
        ],
      ),
    );
  }
}
