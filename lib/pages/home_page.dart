import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app/pages/time_sheets_page.dart';
import 'package:todo_app/pages/todo_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Hive box for working hours
  final _workingHoursBox = Hive.box('working_hours');

  //Bottom navigation bar variables
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'To do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Working hours',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedFontSize: 14,
        elevation: 0,
      ),
      appBar: AppBar(
        title: _selectedIndex == 0
            ? const Text('To Do')
            : const Text('Working hours'),
        centerTitle: true,
        actions: [
          _selectedIndex == 1
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _workingHoursBox.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.restart_alt_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: _selectedIndex == 0 ? const ToDoListPage() : const TimeSheetsPage(),
    );
  }
}
