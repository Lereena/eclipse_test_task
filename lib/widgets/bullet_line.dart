import 'package:flutter/material.dart';

class BulletLine extends StatelessWidget {
  final Text text;
  const BulletLine({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          '\u2022',
          style: TextStyle(
            fontSize: 16,
            height: 1.55,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(child: text),
      ],
    );
  }
}
