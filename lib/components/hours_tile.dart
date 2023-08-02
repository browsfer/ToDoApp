import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time_range_picker/time_range_picker.dart';

class HoursTile extends StatefulWidget {
  final String weekDay;
  const HoursTile({super.key, required this.weekDay});

  @override
  State<HoursTile> createState() => _HoursTileState();
}

class _HoursTileState extends State<HoursTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple[400],
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      height: MediaQuery.sizeOf(context).height * 0.09,
      // width: MediaQuery.sizeOf(context).width * 1,
      child: Row(
        children: [
          Text(widget.weekDay),
          const Spacer(),
          const Text('Your working time:'),

          //Time Range picker
          IconButton(
              icon: const Icon(Icons.timelapse_outlined), onPressed: () {}),
        ],
      ),
    );
  }
}
