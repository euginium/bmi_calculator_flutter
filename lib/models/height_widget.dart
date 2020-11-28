import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  HeightCard(
      {this.sliderInitialValue,
      this.heightValue,
      this.title,
      this.unit,
      this.max,
      this.min});

  final double sliderInitialValue;
  final Function heightValue;
  final String title;
  final String unit;
  final double min, max;

  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '${widget.title}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Text(
              '${widget.sliderInitialValue.round().toString()} ${widget.unit}',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          Slider(
            value: widget.sliderInitialValue,
            onChanged: widget.heightValue,
            min: widget.min,
            max: widget.max,
          ),
        ],
      ),
    );
  }
}
