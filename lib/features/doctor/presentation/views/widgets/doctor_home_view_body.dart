import 'package:booking_app/constants.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/customTextForm.dart';
import 'package:booking_app/features/doctor/presentation/views/widgets/weekday_schedule_widget.dart';
import 'package:flutter/material.dart';

class DoctorHomeViewBody extends StatefulWidget {
  const DoctorHomeViewBody({super.key});

  @override
  State<DoctorHomeViewBody> createState() => _DoctorHomeViewBodyState();
}

class _DoctorHomeViewBodyState extends State<DoctorHomeViewBody> {
  final _SpecializationController = TextEditingController();
  final _pricePerSessionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hello Dr.Mohamed ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.titleStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
                const CircleAvatar(
                  radius: 25,
                  backgroundImage:
                      AssetImage('assets/images/Hossam-Sakker-alhayani.jpg'),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: boxDecoration,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 36.0, right: 16.0, left: 16.0, bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                        controller: _SpecializationController,
                        labelText: 'Specialization'),
                    const SizedBox(height: 22),
                    CustomTextFormField(
                        controller: _pricePerSessionController,
                        labelText: 'Price Per Session'),
                    const SizedBox(height: 32),

                    // Weekday Schedule Widget
                    WeekdayScheduleWidget(
                      onScheduleSaved: _handleScheduleSaved,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void _handleScheduleSaved(Map<String, dynamic> schedule) {
    print('Schedule saved from parent: $schedule');
    print('Specialization: ${_SpecializationController.text}');
    print('Price per session: ${_pricePerSessionController.text}');
  }
}
