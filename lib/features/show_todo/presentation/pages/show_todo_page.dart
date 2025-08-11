import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/show_todo_controller.dart';
import '../../../add_todo/presentation/pages/add_todo_page.dart';

class ShowTodoPage extends StatelessWidget {
  const ShowTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ShowTodoController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: Obx(() => ListView.builder(
            itemCount: ctrl.todos.length,
            itemBuilder: (_, i) => ListTile(title: Text(ctrl.todos[i].title)),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddTodoPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
