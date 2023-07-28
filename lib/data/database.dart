import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('myList');

  //On first time ever opening app
  void createInitialData() {
    toDoList = [
      ['Put your first "To Do" thing!', false],
    ];
  }

  //Load existing data
  void loadDatabase() {
    toDoList = _myBox.get("TODOLIST");
  }

  //Update data
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
