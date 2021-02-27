import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: new Image.asset('assets/graph.jpeg',),
      alignment: Alignment.center,
    );
  }
}
