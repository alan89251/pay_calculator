import 'package:flutter/material.dart';

class MainPart extends StatelessWidget {
  const MainPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Number of hours'
              )
          ),
        ),
        const Center(
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Hourly rate'
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
              onPressed: () {
              },
              child: const Text('Calculate')
          ),
        ),
        const Center(
            child: Text('Report')
        )
      ],
    );
  }
}