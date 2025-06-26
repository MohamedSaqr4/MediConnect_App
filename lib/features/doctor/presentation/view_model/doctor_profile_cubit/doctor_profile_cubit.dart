import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../data/models/doctor_model.dart';

part 'doctor_profile_state.dart';

class DoctorProfileCubit extends Cubit<DoctorProfileState> {
  DoctorProfileCubit() : super(DoctorProfileInitial());

  final nameController = TextEditingController();
  final specializationController = TextEditingController();
  final clinicAddressController = TextEditingController();
  final sessionPriceController = TextEditingController();
  final passwordController = TextEditingController();

  void loadProfile(DoctorModel user) {
    nameController.text = user.name;
    specializationController.text = user.specialization;
    clinicAddressController.text = user.clinicAddress;
    sessionPriceController.text = user.sessionPrice;
    emit(DoctorProfileLoaded(user));
  }

  void updateProfile() {
    emit(DoctorProfileUpdated());
  }

  @override
  Future<void> close() {
    nameController.dispose();
    specializationController.dispose();
    clinicAddressController.dispose();
    sessionPriceController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
