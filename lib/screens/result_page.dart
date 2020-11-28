import 'package:bmi_app_own_challenge/screens/bmi_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.result, this.category, this.color});

  final String result;
  final String category;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///text
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text(
                    'RESULTS',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  )),
                  Center(
                      child: Text(
                    '$result',
                    style:
                        TextStyle(fontSize: 150, fontWeight: FontWeight.bold),
                  )),
                  Center(
                    child: Text(
                      '$category',
                      style: TextStyle(fontSize: 30, color: color),
                    ),
                  ),
                ],
              ),
            ),

            ///button
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
