class Doctor {
  final String id;
  final String name;
  final String specialization;
  final String about;
  final String image;
  final String location;
  final String consultationFee;
  final List<AvailableTime> availableTimes;

  Doctor({
    required this.id,
    required this.name,
    required this.specialization,
    required this.about,
    required this.image,
    required this.location,
    required this.consultationFee,
    required this.availableTimes,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      specialization: json['specialization'] ?? '',
      about: json['about'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
      consultationFee: json['consultationFee'] ?? '',
      availableTimes: (json['availableTimes'] as List<dynamic>?)
              ?.map((time) => AvailableTime.fromJson(time))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
      'about': about,
      'image': image,
      'location': location,
      'consultationFee': consultationFee,
      'availableTimes': availableTimes.map((time) => time.toJson()).toList(),
    };
  }
}

class AvailableTime {
  final String day;
  final String startTime;
  final String endTime;

  AvailableTime({
    required this.day,
    required this.startTime,
    required this.endTime,
  });

  factory AvailableTime.fromJson(Map<String, dynamic> json) {
    return AvailableTime(
      day: json['day'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  @override
  String toString() {
    return '$day $startTime - $endTime';
  }
}
