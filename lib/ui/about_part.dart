import 'package:flutter/material.dart';

class AboutPart extends StatelessWidget {
  const AboutPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      child: const Text(
        'Chun Fung Suen'
        '\n'
        '301277969',
        textAlign: TextAlign.center,
      ),
    );
  }
}