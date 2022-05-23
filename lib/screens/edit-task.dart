import 'package:ad_listing_full_app/controllers/todo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTaskScreen extends StatefulWidget {
  var task = {};
  EditTaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _taskCtrl = TextEditingController();

  final TodoController _todoController = Get.put(TodoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskCtrl.text = widget.task["title"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(children: [
        TextField(
          controller: _taskCtrl,
        ),
        ElevatedButton(
          onPressed: () {
            _todoController.updateTask(widget.task["id"], _taskCtrl.text);
          },
          child: const Text("Update Task"),
        ),
        TextButton(
          onPressed: () {
            _todoController.deleteTask(widget.task["id"]);
          },
          child: const Text("Delete"),
        ),
      ]),
    );
  }
}