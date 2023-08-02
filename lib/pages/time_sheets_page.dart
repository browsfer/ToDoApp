import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';

class TimeSheetsPage extends StatefulWidget {
  const TimeSheetsPage({super.key});

  @override
  State<TimeSheetsPage> createState() => _TimeSheetsPageState();
}

class _TimeSheetsPageState extends State<TimeSheetsPage> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String workHours = '0.0';

  //List of week days
  Map<String, String> workHoursMap = {
    'Monday': '0.0',
    'Tuesday': '0.0',
    'Wednesday': '0.0',
    'Thursday': '0.0',
    'Friday': '0.0',
    'Saturday': '0.0',
    'Sunday': '0.0',
  };

  List<TimeRange> selectedTimeRanges = List.filled(
    7,
    TimeRange(
      startTime: const TimeOfDay(hour: 0, minute: 0),
      endTime: const TimeOfDay(hour: 0, minute: 0),
    ),
  );

  void _selectTimeRange(BuildContext context, int dayIndex) async {
    TimeRange? result = await showTimeRangePicker(
      context: context,
      start: const TimeOfDay(hour: 6, minute: 0),
      end: const TimeOfDay(hour: 14, minute: 30),
      strokeWidth: 12,
      handlerRadius: 14,
      interval: const Duration(minutes: 30),
      backgroundWidget: Image.asset(
        'assets/time_image.png',
        width: 200,
        height: 200,
      ),
      labels: [
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 6, minute: 0), text: "Get up"),
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 9, minute: 0), text: "Coffee time"),
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 15, minute: 0), text: "Afternoon"),
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 18, minute: 0),
            text: "Time for a beer"),
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 22, minute: 0), text: "Go to Sleep"),
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 2, minute: 0), text: "Go for a pee"),
        ClockLabel.fromTime(
            time: const TimeOfDay(hour: 12, minute: 0), text: "Lunchtime!")
      ],
      ticksColor: Colors.white,
      labelOffset: 40,
      padding: 55,
      labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
    );

    if (result != null) {
      setState(() {
        selectedTimeRanges[dayIndex] = result;
        startTime = result.startTime;
        endTime = result.endTime;
        workHours = _calculateWorkHours(result);
        workHoursMap[getDayOfWeek(dayIndex)] = _calculateWorkHours(result);
      });
    }
  }

  String getDayOfWeek(int dayIndex) {
    final now = DateTime.now();
    final firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final dayOfWeek = firstDayOfWeek.add(Duration(days: dayIndex));
    return DateFormat('EEEE').format(dayOfWeek);
  }

  String _calculateWorkHours(TimeRange? result) {
    if (result != null) {
      final startHour = startTime!.hour + startTime!.minute / 60;
      final endHour = endTime!.hour + endTime!.minute / 60;

      return (endHour - startHour).toStringAsFixed(2);
    } else {
      return '0.0';
    }
  }

  String _calculateTotalWorkHours() {
    double totalHours = 0.0;
    workHoursMap.forEach((day, hours) {
      totalHours += double.parse(hours);
    });
    return totalHours.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 7; i++)
              ElevatedButton(
                onPressed: () => _selectTimeRange(context, i),
                child: Text(getDayOfWeek(i)),
              ),
            const SizedBox(height: 16),
            Text(
              'Total Work Hours: ${_calculateTotalWorkHours()}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
