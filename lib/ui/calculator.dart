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
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              child: MainPart(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
              child: AboutPart(),
            ),
          ],
        ),
      ),
    );
  }
}