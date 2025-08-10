import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_todo_controller.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<AddTodoController>();
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _controller),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => ctrl.addTodo(_controller.text),
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
