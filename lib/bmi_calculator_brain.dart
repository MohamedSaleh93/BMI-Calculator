import 'dart:math';

import 'package:bmi_calculator/bmi_result.dart';

class BMICalculatorBrain {
  BMIResult calculateBmi(int height, int weight) {
    double heightInMeters = height / 100;
    double bmiResult = weight / pow(heightInMeters, 2);
    return _getResult(bmiResult);
  }

  BMIResult _getResult(double bmiValue) {
    if (bmiValue < 18.5) {
      return BMIResult(
          value: bmiValue,
          status: "Underweight",
          description: "You are in a good situation, Good job");
    } else if (bmiValue >= 18.5 || bmiValue <= 24.9) {
      return BMIResult(
          value: bmiValue,
          status: "Healthy weight",
          description: "You are Very good, keep going");
    } else if (bmiValue >= 25 || bmiValue <= 29.9) {
      return BMIResult(
          value: bmiValue,
          status: "Overweight",
          description: "You need to make some workouts to lose some weights");
    } else if (bmiValue > 30) {
      return BMIResult(
          value: bmiValue,
          status: "Obese",
          description: "OMG, you need to see doctor very soon");
    } else {
      return null;
    }
  }
}
