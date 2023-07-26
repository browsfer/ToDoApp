import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      content: const TextField(
        decoration: InputDecoration(hintText: 'Type your new task here'),
      ),
      actions: [
        ElevatedButton.icon(
          onPressed: null,
          icon: Icon(Icons.add),
          label: Text('Add new task'),
        ),
        ElevatedButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.cancel),
          label: Text('Cancel'),
        ),
      ],
    );
  }
}
