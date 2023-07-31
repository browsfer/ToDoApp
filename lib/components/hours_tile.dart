import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class HoursTile extends StatelessWidget {
  final String weekDay;
  const HoursTile({super.key, required this.weekDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple[400],
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).width * 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(weekDay),

          //Time Range picker
          IconButton(
            icon: const Icon(Icons.time_to_leave),
            onPressed: () async {
              var result = await showTimeRangePicker(
                context: context,
                start: TimeOfDay(hour: 6, minute: 0),
                strokeWidth: 12,
                handlerRadius: 14,
                backgroundWidget: Image.asset(
                  'assets/time_image.png',
                  width: 200,
                  height: 200,
                ),
                labels: [
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 6, minute: 0),
                      text: "Get up"),
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 9, minute: 0),
                      text: "Coffee time"),
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 15, minute: 0),
                      text: "Afternoon"),
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 18, minute: 0),
                      text: "Time for a beer"),
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 22, minute: 0),
                      text: "Go to Sleep"),
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 2, minute: 0),
                      text: "Go for a pee"),
                  ClockLabel.fromTime(
                      time: const TimeOfDay(hour: 12, minute: 0),
                      text: "Lunchtime!")
                ],
                ticksColor: Colors.white,
                labelOffset: 40,
                padding: 55,
                labelStyle: const TextStyle(fontSize: 18, color: Colors.black),
              );
              print(result);
            },
          ),
        ],
      ),
    );
  }
}
