import 'package:booking_app/custom/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';

class WeekdayScheduleWidget extends StatefulWidget {
  final Function(Map<String, dynamic>) onScheduleSaved;

  const WeekdayScheduleWidget({
    Key? key,
    required this.onScheduleSaved,
  }) : super(key: key);

  @override
  State<WeekdayScheduleWidget> createState() => _WeekdayScheduleWidgetState();
}

class _WeekdayScheduleWidgetState extends State<WeekdayScheduleWidget> {
  // Weekday time selection variables
  final List<String> weekdays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  Map<String, bool> dayEnabled = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  Map<String, TimeOfDay> startTimes = {
    'Monday': const TimeOfDay(hour: 9, minute: 0),
    'Tuesday': const TimeOfDay(hour: 9, minute: 0),
    'Wednesday': const TimeOfDay(hour: 9, minute: 0),
    'Thursday': const TimeOfDay(hour: 9, minute: 0),
    'Friday': const TimeOfDay(hour: 9, minute: 0),
    'Saturday': const TimeOfDay(hour: 9, minute: 0),
    'Sunday': const TimeOfDay(hour: 9, minute: 0),
  };

  Map<String, TimeOfDay> endTimes = {
    'Monday': const TimeOfDay(hour: 17, minute: 0),
    'Tuesday': const TimeOfDay(hour: 17, minute: 0),
    'Wednesday': const TimeOfDay(hour: 17, minute: 0),
    'Thursday': const TimeOfDay(hour: 17, minute: 0),
    'Friday': const TimeOfDay(hour: 17, minute: 0),
    'Saturday': const TimeOfDay(hour: 17, minute: 0),
    'Sunday': const TimeOfDay(hour: 17, minute: 0),
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Available Time Section
        const Text(
          'Available Time',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),
        ...weekdays.map((day) => _buildWeekdayTimeCard(day)).toList(),
        const SizedBox(height: 24),
        CustomButton(
            text: 'Save Sheduale',
            onPressed: _saveSchedule,
            backgroundColor: kPrimaryColor)
      ],
    );
  }

  Widget _buildWeekdayTimeCard(String day) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Checkbox(
                  value: dayEnabled[day],
                  onChanged: (value) {
                    setState(() {
                      dayEnabled[day] = value ?? false;
                    });
                  },
                  activeColor: kPrimaryColor,
                ),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            if (dayEnabled[day] == true) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildTimeSelector(
                      'Start Time',
                      startTimes[day]!,
                      (time) {
                        setState(() {
                          startTimes[day] = time;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildTimeSelector(
                      'End Time',
                      endTimes[day]!,
                      (time) {
                        setState(() {
                          endTimes[day] = time;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTimeSelector(
      String label, TimeOfDay time, Function(TimeOfDay) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: time,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    timePickerTheme: TimePickerThemeData(
                      backgroundColor: Colors.white,
                      hourMinuteTextColor: kPrimaryColor,
                      hourMinuteColor: kPrimaryColor.withOpacity(0.1),
                      dialHandColor: kPrimaryColor,
                      dialBackgroundColor: kPrimaryColor.withOpacity(0.1),
                      dialTextColor: kPrimaryColor,
                      entryModeIconColor: kPrimaryColor,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (newTime != null) {
              onChanged(newTime);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.access_time, color: kPrimaryColor),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _saveSchedule() {
    // Validate that at least one day is selected
    bool hasSelectedDay = dayEnabled.values.any((enabled) => enabled);

    if (!hasSelectedDay) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one day for your schedule'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validate time ranges
    for (String day in weekdays) {
      if (dayEnabled[day] == true) {
        TimeOfDay start = startTimes[day]!;
        TimeOfDay end = endTimes[day]!;

        int startMinutes = start.hour * 60 + start.minute;
        int endMinutes = end.hour * 60 + end.minute;

        if (startMinutes >= endMinutes) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('End time must be after start time for $day'),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      }
    }

    // Save the schedule
    Map<String, dynamic> schedule = {};
    for (String day in weekdays) {
      if (dayEnabled[day] == true) {
        schedule[day] = {
          'enabled': true,
          'startTime':
              '${startTimes[day]!.hour.toString().padLeft(2, '0')}:${startTimes[day]!.minute.toString().padLeft(2, '0')}',
          'endTime':
              '${endTimes[day]!.hour.toString().padLeft(2, '0')}:${endTimes[day]!.minute.toString().padLeft(2, '0')}',
        };
      }
    }

    // Show success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Schedule saved successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Call the callback function to pass the schedule data to parent
    widget.onScheduleSaved(schedule);
  }
}
