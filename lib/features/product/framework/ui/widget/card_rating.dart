

import 'package:flutter/material.dart';

class CardRating extends StatelessWidget {
  const CardRating({
    required this.rate,
    super.key
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: 
        List.generate(rate.floor(), (index) {
          return const Icon(Icons.star, color: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),);
        })
    );
  }
}