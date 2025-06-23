import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/views/DoctorDetailsView.dart';

class HomeView extends StatelessWidget {
    static String routeName = "HomeView";

  HomeView({super.key});

  final List<String> symptoms = [
    'temperature',
    'Fever',
    'Cough',
    'cold',
    'Headache',
  ];

  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Ahmed Ali',
      'specialization': 'Cardiologist',
      'rating': 4.8,
      'experience': '10',
      'about':
          'Experienced cardiologist with expertise in heart diseases and treatments.',
      'image': 'assets/images/Hossam-Sakker-alhayani.jpg',
    },
    {
      'name': 'Dr. Fatima Mohamed',
      'specialization': 'Pediatrician',
      'rating': 4.7,
      'experience': '8',
      'about': 'Pediatrician who cares about children\'s health.',
      'image': 'assets/images/doctorr.png',
    },
    {
      'name': 'Dr. Youssef Hassan',
      'specialization': 'Surgeon',
      'rating': 4.9,
      'experience': '12',
      'about': 'Skilled surgeon in complex surgical operations.',
      'image': 'assets/images/images.jpg',
    },
    {
      'name': 'Dr. Sayed Ibrahim',
      'specialization': 'Psychologist',
      'rating': 4.6,
      'experience': '7',
      'about': 'Psychologist providing mental health support.',
      'image': 'assets/images/doctor3.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with greeting and profile
            const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Hello Mohamed',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                   CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        AssetImage('assets/images/1748632292669.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Appointment options
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Clinic Visit
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 4,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.add, color: kPrimaryColor),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Clinic Visit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Make an appointment',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Home Visit
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 4,
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade100,
                            child: const Icon(Icons.home_filled,
                                color: kPrimaryColor),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Home Visit',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Call The Doctor Home',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // Symptoms
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'What Are Your Symptoms?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: symptoms.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          symptoms[index],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // Popular Doctors
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Popular Doctors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: doctors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorDetailsView(doctor: doctor),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(doctor['image']),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            doctor['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            doctor['specialization'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star, color: Colors.amber),
                              Text(
                                doctor['rating'].toString(),
                                style: const TextStyle(color: Colors.black45),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
