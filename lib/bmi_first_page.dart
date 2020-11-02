import 'package:bmi_calculator/bmi_calculator_brain.dart';
import 'package:bmi_calculator/bmi_result.dart';
import 'package:bmi_calculator/bmi_result_screen.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

enum Gender { MALE, FEMALE }

class BMIFirstPage extends StatefulWidget {
  @override
  _BMIFirstPageState createState() => _BMIFirstPageState();
}

class _BMIFirstPageState extends State<BMIFirstPage> {
  int heightValue = 180;
  int weightValue = 70;
  int age = 20;
  Gender selectedGender;

  Color maleBackground = Color(CARD_BACKGROUND_COLOR);
  Color feMaleBackground = Color(CARD_BACKGROUND_COLOR);

  BMICalculatorBrain bmiCalculatorBrain = BMICalculatorBrain();

  // 1 => Male, 2 => Female
  void onGenderPressed(Gender selectedGender) {
    if (selectedGender == Gender.MALE) {
      // User clicked on Male
      if (maleBackground == Color(CARD_CLICKED_COLOR)) {
        this.selectedGender = null;
        maleBackground = Color(CARD_BACKGROUND_COLOR);
      } else {
        this.selectedGender = selectedGender;
        maleBackground = Color(CARD_CLICKED_COLOR);
        feMaleBackground = Color(CARD_BACKGROUND_COLOR);
      }
    } else {
      // User clicked on Female
      if (feMaleBackground == Color(CARD_CLICKED_COLOR)) {
        this.selectedGender = null;
        feMaleBackground = Color(CARD_BACKGROUND_COLOR);
      } else {
        this.selectedGender = selectedGender;
        feMaleBackground = Color(CARD_CLICKED_COLOR);
        maleBackground = Color(CARD_BACKGROUND_COLOR);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      onGenderPressed(Gender.MALE);
                    });
                  },
                  backgroundColor: maleBackground,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 55,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(
                              color: Color(CARD_TITLE_COLOR), fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPressed: () {
                    setState(() {
                      onGenderPressed(Gender.FEMALE);
                    });
                  },
                  backgroundColor: feMaleBackground,
                  cardChild: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 55,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              color: Color(CARD_TITLE_COLOR), fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ReusableCard(
              backgroundColor: Color(CARD_BACKGROUND_COLOR),
              cardChild: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                          fontSize: 25, color: Color(CARD_TITLE_COLOR)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          heightValue.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                              color: Color(CARD_ITEM_COLOR), fontSize: 20),
                        )
                      ],
                    ),
                    Slider(
                        value: heightValue.toDouble(),
                        min: 100,
                        max: 200,
                        onChanged: (double newValue) {
                          setState(() {
                            heightValue = newValue.round();
                          });
                        })
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  backgroundColor: Color(CARD_BACKGROUND_COLOR),
                  cardChild: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                              color: Color(CARD_TITLE_COLOR), fontSize: 25),
                        ),
                        Text(
                          weightValue.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: Color(CARD_BACKGROUND_COLOR),
                              onPressed: () {
                                setState(() {
                                  weightValue++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: Color(CARD_BACKGROUND_COLOR),
                              onPressed: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  backgroundColor: Color(CARD_BACKGROUND_COLOR),
                  cardChild: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              color: Color(CARD_TITLE_COLOR), fontSize: 25),
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: Color(CARD_FLOAT_BUTTON_COLOR),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              backgroundColor: Color(CARD_FLOAT_BUTTON_COLOR),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          FlatButton(
            onPressed: () {
              BMIResult result =
                  bmiCalculatorBrain.calculateBmi(heightValue, weightValue);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BMIResultScreen(
                            bmiResult: result,
                          )));
            },
            child: Container(
              width: double.infinity,
              height: 80,
              color: Color(CALCULATE_BMI_BUTTON_COLOR),
              child: Center(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
