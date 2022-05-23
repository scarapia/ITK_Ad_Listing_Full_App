import 'package:ad_listing_full_app/controllers/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  final TextEditingController _taskCtrl = TextEditingController();
  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Column(children: [
        TextField(
          controller: _taskCtrl,
        ),
        ElevatedButton(
          onPressed: () {
            _todoController.addTask(_taskCtrl.text);
          },
          child: const Text("Add Task"),
        ),
      ]),
    );
  }
}