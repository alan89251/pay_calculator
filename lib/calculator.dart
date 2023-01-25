import 'package:flutter/material.dart';
import 'main_part.dart';
import 'about_part.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Calculator'),
      ),
      body: Column(
        children: [
          MainPart(),
          AboutPart()
        ]
      ),
    );
  }
}