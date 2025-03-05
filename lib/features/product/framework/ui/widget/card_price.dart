

import 'package:flutter/material.dart';

class CardPrice extends StatelessWidget {
  const CardPrice({
    required this.price,
    super.key
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$price", style: TextStyle(
          fontSize: 18
        ),)
      ],
    );
  }
}