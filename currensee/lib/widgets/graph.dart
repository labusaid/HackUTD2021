import 'package:flutter/material.dart';

class Graph extends StatelessWidget {
  final int height;

  Graph(this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: new Image.asset('assets/graph.jpeg', fit: BoxFit.contain,),
      alignment: Alignment.center,
      height: this.height.toDouble(),
    );
  }
}
