import 'package:flutter/material.dart';

class AboutPart extends StatelessWidget {
  const AboutPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: const [
          Text(
            'Chun Fung Suen'
            '\n'
            '301277969',
            textAlign: TextAlign.center,
          ),
        ],
      )
    );
  }
}