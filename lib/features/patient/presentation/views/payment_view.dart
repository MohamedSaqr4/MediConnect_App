import 'package:booking_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/constants.dart';
import 'package:booking_app/features/patient/domain/models/doctor.dart';
import 'package:booking_app/features/patient/presentation/views/ChatView.dart';
import 'package:go_router/go_router.dart';

class PaymentView extends StatefulWidget {
  final Doctor doctor;
  final AvailableTime selectedTime;
  final String bookingType;

  const PaymentView({
    super.key,
    required this.doctor,
    required this.selectedTime,
    required this.bookingType,
  });

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String selectedPaymentMethod = 'Credit Card';
  final List<String> paymentMethods = [
    'Credit Card',
    'Debit Card',
    'PayPal',
    'Cash on Delivery',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () =>
GoRouter.of(context).push(AppRouter.kPatientNavBar),
          ),
          title: const Text('Payment'),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appointment Summary
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Appointment Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildSummaryRow('Doctor', widget.doctor.name),
                      _buildSummaryRow(
                          'Specialization', widget.doctor.specialization),
                      _buildSummaryRow('Date', widget.selectedTime.day),
                      _buildSummaryRow('Time',
                          '${widget.selectedTime.startTime} - ${widget.selectedTime.endTime}'),
                      _buildSummaryRow('Location', widget.doctor.location),
                      _buildSummaryRow(
                          'Booking Type', widget.bookingType.toUpperCase()),
                      const Divider(),
                      _buildSummaryRow(
                        'Total Amount',
                        widget.doctor.consultationFee,
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Payment Method Selection
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Payment Method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...paymentMethods
                          .map((method) => RadioListTile<String>(
                                title: Text(method),
                                value: method,
                                groupValue: selectedPaymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    selectedPaymentMethod = value!;
                                  });
                                },
                                activeColor: kPrimaryColor,
                              ))
                          .toList(),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Payment Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _processPayment(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? kPrimaryColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _processPayment() {
    // Show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Processing payment..."),
            ],
          ),
        );
      },
    );

    // Simulate payment processing
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop(); // Close loading dialog

      // Show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Payment Successful!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Your online appointment has been confirmed.'),
                const SizedBox(height: 8),
                Text('Payment Method: $selectedPaymentMethod'),
                Text('Amount: ${widget.doctor.consultationFee}'),
                const SizedBox(height: 8),
                const Text(
                  'You will receive a confirmation email with meeting details.',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),
                const Text(
                  'You can now start chatting with your doctor!',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  // Navigate to chat with doctor
                  try {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChatView(
                          isDoctorChat: true,
                          doctor: {
                            'name': widget.doctor.name,
                            'specialization': widget.doctor.specialization,
                            'image': widget.doctor.image,
                          },
                        ),
                      ),
                    );
                  } catch (e) {
                    // Fallback: show error and go home
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Navigation error: $e'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                },
                child: const Text('Start Chat'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                  Navigator.of(context)
                      .popUntil((route) => route.isFirst); // Go to home
                },
                child: const Text('Go Home'),
              ),
            ],
          );
        },
      );
    });
  }
}
