import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/domain/models/doctor.dart';

class DoctorCard extends StatefulWidget {
  final Doctor doctor;
  final Function(AvailableTime)? onOnlineBooking;
  final Function(AvailableTime)? onOfflineBooking;

  const DoctorCard({
    super.key,
    required this.doctor,
    this.onOnlineBooking,
    this.onOfflineBooking,
  });

  @override
  State<DoctorCard> createState() => _DoctorCardState();
}

class _DoctorCardState extends State<DoctorCard> {
  AvailableTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Info Section
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(widget.doctor.image),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.doctor.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.doctor.specialization,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: kPrimaryColor,
                        ),
                      ),
                      if (widget.doctor.about.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            widget.doctor.about,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),

            // Location Section
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    widget.doctor.location,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            // Consultation Fee
            Text(
              'Consultation Fee: ${widget.doctor.consultationFee}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 10),

            // Available Times Section
            Row(
              children: [
                const Icon(Icons.access_time, size: 16, color: Colors.grey),
                const SizedBox(width: 6),
                const Text(
                  'Available Times:',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            
            // Time Selection
            ...widget.doctor.availableTimes.map((time) => Padding(
              padding: const EdgeInsets.only(left: 22, bottom: 8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedTime = time;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedTime == time ? kPrimaryColor.withOpacity(0.1) : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: selectedTime == time ? kPrimaryColor : Colors.grey.shade300,
                      width: selectedTime == time ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedTime == time ? Icons.check_circle : Icons.radio_button_unchecked,
                        size: 16,
                        color: selectedTime == time ? kPrimaryColor : Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: selectedTime == time ? kPrimaryColor : Colors.grey,
                          fontWeight: selectedTime == time ? FontWeight.w500 : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )).toList(),
            
            const SizedBox(height: 12),

            // Booking Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: selectedTime != null 
                        ? () => widget.onOnlineBooking?.call(selectedTime!)
                        : null,
                    icon: const Icon(Icons.video_call),
                    label: const Text("Book Online"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: selectedTime != null 
                        ? () => widget.onOfflineBooking?.call(selectedTime!)
                        : null,
                    icon: const Icon(Icons.person),
                    label: const Text("Book Offline"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Selection reminder
            if (selectedTime == null)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Please select an available time to book',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.orange,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
