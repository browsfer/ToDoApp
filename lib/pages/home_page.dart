import 'package:flutter/material.dart';
import 'package:todo_app/components/alert_box.dart';
import 'package:todo_app/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

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
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.insert(0, [_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //Add a new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) => AlertBox(
        controller: _controller,
        saveNewTask: saveNewTask,
      ),
    );
  }

  //Delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxClicked(index, value),
          onDelete: (context) => deleteTask(index),
        ),
      ),
    );
  }
}
