import 'package:flutter/material.dart';
import 'package:todo_app/components/hours_tile.dart';

class TimeSheetsPage extends StatelessWidget {
  const TimeSheetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Column(
          //Days + time chooser
          children: [
            Center(
              child: Text('Current week date'),
            ),
            HoursTile(weekDay: 'Mon'),
            HoursTile(weekDay: 'Tue'),
            HoursTile(weekDay: 'Wed'),
            HoursTile(weekDay: 'Thu'),
            HoursTile(weekDay: 'Fri'),
            HoursTile(weekDay: 'Sat'),
            HoursTile(weekDay: 'Sun'),
          ],
        ),
      ],
    );
  }
}
