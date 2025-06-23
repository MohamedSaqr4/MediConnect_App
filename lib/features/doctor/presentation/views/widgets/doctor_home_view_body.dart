import 'package:flutter/material.dart';
import 'package:booking_app/features/authentication/presentation/views/widgets/customTextForm.dart';

class DoctorHomeViewBody extends StatefulWidget {
  const DoctorHomeViewBody({super.key});

  @override
  State<DoctorHomeViewBody> createState() => _DoctorHomeViewBodyState();
}

class _DoctorHomeViewBodyState extends State<DoctorHomeViewBody> {
  final TextEditingController _specializationController =
      TextEditingController(text: 'Cardiology');
  final TextEditingController _priceController =
      TextEditingController(text: '300');
  List<TextEditingController> _slotControllers = [];
  final List<String> _initialSlots = [
    'Monday, 10:00 AM - 12:00 PM',
    'Tuesday, 2:00 PM - 4:00 PM',
    'Wednesday, 10:00 AM - 12:00 PM',
    'Thursday, 2:00 PM - 4:00 PM',
    'Friday, 10:00 AM - 12:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    _slotControllers =
        _initialSlots.map((s) => TextEditingController(text: s)).toList();
  }

  @override
  void dispose() {
    _specializationController.dispose();
    _priceController.dispose();
    for (var c in _slotControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Avatar + Welcome text
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('assets/images/doctor_avatar.png'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Welcome Dr. Mohamed',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text('Specialization',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: _specializationController,
            labelText: 'Specialization',
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          Text('Price per session',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          CustomTextFormField(
            controller: _priceController,
            labelText: 'Price per session',
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 28),
          Text('Available slots',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...List.generate(
              _slotControllers.length,
              (i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _slotControllers[i],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
