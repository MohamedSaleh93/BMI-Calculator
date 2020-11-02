import 'package:bmi_calculator/bmi_result.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatefulWidget {
  BMIResultScreen({@required this.bmiResult});
  final BMIResult bmiResult;
  @override
  _BMIResultScreenState createState() =>
      _BMIResultScreenState(bmiResult: bmiResult);
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  _BMIResultScreenState({@required this.bmiResult});
  final BMIResult bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Result'),
      ),
      body: Column(
        children: [
          Text(
            'Your Result',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ReusableCard(
              backgroundColor: Color(CARD_BACKGROUND_COLOR),
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    bmiResult.bmiStatus,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiResult.bmiValue.toStringAsFixed(1),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    bmiResult.description,
                    style: TextStyle(fontSize: 25, color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
