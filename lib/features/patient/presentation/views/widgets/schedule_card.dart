import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';

class ScheduleCard extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String date;
  final String time;
  final String location;
  final String imagePath;
  final String appointmentType;
  final VoidCallback onChatPressed;

  const ScheduleCard({
    Key? key,
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.time,
    required this.location,
    required this.imagePath,
    required this.appointmentType,
    required this.onChatPressed, required Null Function() onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Doctor image and name
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    imagePath,
                    height: 56,
                    width: 56,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              doctorName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Chip(
                            label: Text(
                              appointmentType,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            backgroundColor: appointmentType == 'Online'
                                ? Colors.green
                                : Colors.blueGrey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        specialization,
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black54),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, indent: 20, endIndent: 20),
          // Appointment details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(date, style: const TextStyle(fontSize: 13)),
                const SizedBox(width: 16),
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(time, style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(fontSize: 13),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          // Action button
          Padding(
            padding: const EdgeInsets.only(right: 8, bottom: 8, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.chat_bubble_outline,
                      color: kPrimaryColor),
                  tooltip: 'Chat with Doctor',
                  onPressed: onChatPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
