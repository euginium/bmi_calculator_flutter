import 'package:flutter/material.dart';

class GenderCardWidget extends StatefulWidget {
  GenderCardWidget({this.gender, this.color});

  final String gender;
  Color color;

  @override
  _GenderCardWidgetState createState() => _GenderCardWidgetState();
}

class _GenderCardWidgetState extends State<GenderCardWidget> {
  // bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.person,
              size: 100.0,
            ),
            Center(
              child: Text(
                widget.gender,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        margin: EdgeInsets.all(12),
        height: 200,
      ),
    );
  }
}
