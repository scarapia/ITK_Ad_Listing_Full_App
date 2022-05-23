import 'package:ad_listing_full_app/controllers/todo.dart';
import 'package:ad_listing_full_app/screens/add-task.dart';
import 'package:ad_listing_full_app/screens/edit-task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeValidationScreen extends StatelessWidget {
  HomeValidationScreen({Key? key}) : super(key: key);

  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks"), actions: [
        IconButton(
          icon: const Icon(Icons.account_box),
          onPressed: () {
           // Get.to(MyProfileScreen());
          },
        ),
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            _todoController.getTask();
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
           // Get.to(SettingsScreen());
          },
        )
      ]),
      body: Obx(
        () => ListView.builder(
          itemCount: _todoController.tasks.length,
          itemBuilder: (bc, index) {
            return ListTile(
              title: Text(_todoController.tasks[index]['title']),
              onTap: () {
                Get.to(EditTaskScreen(task: _todoController.tasks[index]));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddTaskScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}