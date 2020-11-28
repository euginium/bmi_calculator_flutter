import 'dart:io';
import 'dart:ui';
import 'package:bmi_app_own_challenge/models/height_widget.dart';
import 'package:bmi_app_own_challenge/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app_own_challenge/models/gender_card_widget.dart';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  double initialValue = 160.0;
  double weightValue = 60;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI ',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text(
              'CALCULATOR',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.indigo.shade400,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ///top cards
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenderCardWidget(
                    gender: 'MALE',
                    color: Colors.grey.shade800,
                  ),
                  GenderCardWidget(
                    gender: 'FEMALE',
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
            ),
          ),

          /// middle card
          Expanded(
            flex: 3,
            child: HeightCard(
              sliderInitialValue: initialValue,
              heightValue: (double value) {
                setState(() {
                  initialValue = value;
                });
              },
              title: 'HEIGHT',
              unit: 'cm',
              min: 140,
              max: 250,
            ),
          ),

          ///bottom card
          Expanded(
            flex: 3,
            child: HeightCard(
              sliderInitialValue: weightValue,
              heightValue: (double value) {
                setState(() {
                  weightValue = value;
                });
              },
              min: 40,
              max: 200,
              title: 'WEIGHT',
              unit: 'kg',
            ),
          ),

          ///calculate button
          Expanded(
            child: GestureDetector(
              onTap: () {
                String category;
                var result =
                    (weightValue / initialValue / initialValue) * 10000;
                print(result);
                if (result <= 25 && result >= 20) {
                  category = 'Normal';
                  color = Colors.white;
                } else if (result <= 19) {
                  category = 'Underweight';
                  color = Colors.purple;
                } else if (result <= 29 && result >= 26) {
                  category = 'Overweight';
                  color = Colors.orange;
                } else if (result <= 39 && result >= 30) {
                  category = 'Class II Obesity';
                  color = Colors.redAccent;
                } else if (result >= 40) {
                  category = 'Class III Obesity';
                  color = Colors.red;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      result: result.round().toString(),
                      category: category,
                      color: color,
                    ),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                    child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
