import 'package:hive_flutter/hive_flutter.dart';

class MyDatabase {
  //List of To Do thingss
  List toDoList = [];

  //List of week days
  Map<dynamic, dynamic> workHoursMap = {};

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

  //Update To Do list
  void updateToDoList() {
    _myBox.put("TODOLIST", toDoList);
  }

  //Update hours list
  void updateHoursList() {
    _workingHoursBox.put('working_hours', workHoursMap);
  }
}
