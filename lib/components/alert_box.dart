import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  final TextEditingController controller;
  final void Function() saveNewTask;

  const AlertBox(
      {super.key, required this.controller, required this.saveNewTask});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('New task!'),
      elevation: 10,
      //user input
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          hintText: 'Type your new task here',
        ),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: saveNewTask,
          icon: const Icon(Icons.add),
          label: const Text('Add new task'),
        ),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
            controller.clear();
          },
          icon: const Icon(Icons.cancel),
          label: const Text('Cancel'),
        ),
      ],
    );
  }
}
