import 'package:flutter/material.dart';

class MainPart extends StatelessWidget {
  const MainPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Number of hours',
                  filled: true,
                  fillColor: Colors.white,
                )
              ),
            )
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Hourly rate',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            )
          ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
            child: ElevatedButton(
              onPressed: () {

              },
              child: const Text('Calculate')
            ),
          )
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
            child: Container(
              color: Colors.white,
              child: Text('Report'),
            )
          )
        )
        ],
      ),
    );
  }
}