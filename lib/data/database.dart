import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  //List of To Do thingss
  List toDoList = [];

  //List of week days
  Map<String, String> workHoursMap = {};

  final _myBox = Hive.box('TODOLIST');
  final _workingHoursBox = Hive.box('working_hours');

  //On first time ever opening app
  void createInitialData() {
    toDoList = [
      ['Put your first "To Do" thing!', false],
    ];
  }

  //Load existing data
  void loadToDoList() {
    toDoList = _myBox.get("TODOLIST");
  }

  void loadHoursList() {
    workHoursMap = _workingHoursBox.get('working_hours');
  }

  //Update data
  void updateDatabase() {
    _workingHoursBox.put('working_hours', workHoursMap);
    _myBox.put("TODOLIST", toDoList);
  }
}
