import 'package:booking_app/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const onBoardingStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: kPrimaryColor,
    height: 2,
  );
  static const subTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const titleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}
