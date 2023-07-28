import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/alert_box.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  final ToDoDatabase _db = ToDoDatabase();
  //Hive box reference
  final _myBox = Hive.box('myList');

  //Changing checkbox
  void checkBoxClicked(int index, bool? isChanged) {
    setState(() {
      _db.toDoList[index][1] = !_db.toDoList[index][1];
    });
    _db.updateDatabase();
  }

  //Save new task
  void saveNewTask() {
    setState(() {
      _db.toDoList.insert(0, [_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    _db.updateDatabase();
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
      _db.toDoList.removeAt(index);
    });
    _db.updateDatabase();
  }

  @override
  void initState() {
    //If this is first time ever opening app
    if (_myBox.get("TODOLIST") == null) {
      _db.createInitialData();
    } else {
      //If we already have something on the list
      _db.loadDatabase();
    }

    super.initState();
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
        itemCount: _db.toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: _db.toDoList[index][0],
          taskCompleted: _db.toDoList[index][1],
          onChanged: (value) => checkBoxClicked(index, value),
          onDelete: (context) => deleteTask(index),
        ),
      ),
    );
  }
}
