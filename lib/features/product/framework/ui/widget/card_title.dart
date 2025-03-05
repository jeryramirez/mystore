
import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({

    required this.title,
    super.key
  });


  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}