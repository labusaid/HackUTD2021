import 'package:flutter/material.dart';

class GraphFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         RaisedButton(
            onPressed: () {},
            child: const Text('1 Day', style: TextStyle(fontSize: 10)),
          ),
          RaisedButton(
            onPressed: () {},
            child: const Text('1 Week', style: TextStyle(fontSize: 10)),
          ),
          RaisedButton(
            onPressed: () {},
            child: const Text('1 Month', style: TextStyle(fontSize: 10)),
          ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }
}