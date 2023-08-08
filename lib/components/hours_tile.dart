import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';

class HoursTile extends StatefulWidget {
  final String weekDay;
  final String hoursPerDay; // Add the hoursPerDay property
  final void Function() selectWorkTime;

  const HoursTile({
    Key? key,
    required this.weekDay,
    required this.hoursPerDay,
    required this.selectWorkTime,
  }) : super(key: key);

  @override
  State<HoursTile> createState() => _HoursTileState();
}

class _HoursTileState extends State<HoursTile> {
  TimeRange? selectedTimeRange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.deepPurple[400],
      ),
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.weekDay,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 4),
              Text(
                '${widget.hoursPerDay}h',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const Spacer(),
          const Text('Select your time:'),
          IconButton(
            icon: const Icon(Icons.hourglass_empty),
            onPressed: widget.selectWorkTime,
          ),
        ],
      ),
    );
  }
}
