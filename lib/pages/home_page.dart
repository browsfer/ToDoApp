import 'package:flutter/material.dart';
import 'package:todo_app/components/alert_box.dart';
import 'package:todo_app/components/todo_tile.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List of ToDo tasks
  List toDoList = [
    ['Excersise', true],
    ['Learn flutter', true],
    ['Sex', false],
  ];

  //Changing checkbox
  void checkBoxClicked(int index, bool? isChanged) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      ;
    });
  }

  //Add a new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => AlertBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxClicked(index, value),
        ),
      ),
    );
  }
}
