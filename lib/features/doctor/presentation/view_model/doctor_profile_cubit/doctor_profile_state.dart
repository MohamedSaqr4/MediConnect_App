part of 'doctor_profile_cubit.dart';

abstract class DoctorProfileState {}

class DoctorProfileInitial extends DoctorProfileState {}

class DoctorProfileLoaded extends DoctorProfileState {
  final DoctorModel user;
  DoctorProfileLoaded(this.user);
}

class DoctorProfileUpdated extends DoctorProfileState {}
