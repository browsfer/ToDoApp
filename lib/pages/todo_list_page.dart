import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/alert_box.dart';
import '../components/todo_tile.dart';
import '../data/database.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({super.key});

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final _controller = TextEditingController();
  final ToDoDatabase _db = ToDoDatabase();

  //Hive box reference
  final _myBox = Hive.box('TODOLIST');

  //Changing checkbox
  void checkBoxClicked(int index, bool? isChanged) {
    setState(() {
      _db.toDoList[index][1] = !_db.toDoList[index][1];
    });
    _db.updateDatabase();
  }

  //Delete task
  void deleteTask(int index) {
    setState(() {
      _db.toDoList.removeAt(index);
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

  @override
  void initState() {
    //If this is first time ever opening app
    if (_myBox.get("TODOLIST") == null) {
      _db.createInitialData();
    } else {
      //If we already have something on the list
      _db.loadToDoList();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _db.toDoList.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add your first task',
                  style: Theme.of(context).primaryTextTheme.headlineSmall,
                ),
                const SizedBox(height: 5),
                FloatingActionButton(
                  onPressed: addNewTask,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          )
        : Stack(alignment: Alignment.bottomRight, children: [
            ListView.builder(
              itemCount: _db.toDoList.length,
              itemBuilder: (context, index) => ToDoTile(
                taskName: _db.toDoList[index][0],
                taskCompleted: _db.toDoList[index][1],
                onChanged: (value) => checkBoxClicked(index, value),
                onDelete: (context) => deleteTask(index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FloatingActionButton(
                onPressed: addNewTask,
                child: const Icon(Icons.add),
              ),
            ),
          ]);
  }
}
