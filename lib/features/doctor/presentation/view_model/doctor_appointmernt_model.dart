class AppointmentModel {
  final String name;
  final String time;
  final String status;
  final String imageUrl;
  final String day; // Saturday, Sunday, ...

  AppointmentModel({
    required this.name,
    required this.time,
    required this.status,
    required this.imageUrl,
    required this.day,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      name: json['name'],
      time: json['time'],
      status: json['status'],
      imageUrl: json['imageUrl'],
      day: json['day'], // ex: 'Sunday'
    );
  }
}
