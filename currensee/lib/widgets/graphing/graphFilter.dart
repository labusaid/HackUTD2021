import 'package:flutter/material.dart';

class GraphFilter extends StatelessWidget {
  final Function day, week, month;

  GraphFilter(this.day, this.week, this. month);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         RaisedButton(
            onPressed: day,
            child: const Text('1 Day', style: TextStyle(fontSize: 10)),
          ),
          RaisedButton(
            onPressed: week,
            child: const Text('1 Week', style: TextStyle(fontSize: 10)),
          ),
          RaisedButton(
            onPressed: month,
            child: const Text('1 Month', style: TextStyle(fontSize: 10)),
          ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}