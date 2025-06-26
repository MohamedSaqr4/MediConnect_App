class DoctorModel {
  final String name;
  final String specialization;
  final String clinicAddress;
  final String sessionPrice;

  DoctorModel({
    required this.name,
    required this.specialization,
    required this.clinicAddress,
    required this.sessionPrice,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'],
      specialization: json['specialization'],
      clinicAddress: json['clinicAddress'],
      sessionPrice: json['sessionPrice'],
    );
  }
}
