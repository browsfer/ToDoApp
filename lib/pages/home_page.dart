import 'package:flutter/material.dart';
import 'package:todo_app/components/todo_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List toDoList = [
    ['Excersise', true],
    ['Excersise', true],
    ['Sex', false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
        ),
      ),
    );
  }
}
