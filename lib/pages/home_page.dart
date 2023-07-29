import 'package:flutter/material.dart';

import 'package:todo_app/pages/time_sheets_page.dart';
import 'package:todo_app/pages/todo_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),
      body: _selectedIndex == 0 ? const ToDoListPage() : const TimeSheetsPage(),
    );
  }
}
