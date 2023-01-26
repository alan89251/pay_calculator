import 'package:flutter/material.dart';
import 'package:pay_calculator/model/pay_model.dart';
import 'package:provider/provider.dart';

class MainPart extends StatefulWidget {
  const MainPart({super.key});

  @override
  State<MainPart> createState() => _MainPartState();
}

class _MainPartState extends State<MainPart> {
  final _numberOfHoursController = TextEditingController();
  final _hourlyRateController = TextEditingController();

  @override
  void dispose() {
    _numberOfHoursController.dispose();
    _hourlyRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PayModel>(
      builder: (context, payModel, child) {
        return Container(
          color: Colors.grey,
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 4.0),
                  child: TextField(
                    controller: _numberOfHoursController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Number of hours',
                      filled: true,
                      fillColor: Colors.white,
                    )
                  ),
                )
              ),
              Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                    child: TextField(
                      controller: _hourlyRateController,
                      decoration: const InputDecoration(
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
                          payModel.setInfo(int.parse(_numberOfHoursController.text), double.parse(_hourlyRateController.text));
                        },
                        child: const Text('Calculate')
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                          text: '',
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                                text: 'Report',
                                style: TextStyle(
                                    decoration: TextDecoration.underline
                                )
                            ),
                            const TextSpan(text: '\n'),
                            TextSpan(text: 'regular pay: ${payModel.regularPay}'),
                            const TextSpan(text: '\n'),
                            TextSpan(text: 'overtime pay: ${payModel.overtimePay}'),
                            const TextSpan(text: '\n'),
                            TextSpan(text: 'total pay: ${payModel.totalPay}'),
                            const TextSpan(text: '\n'),
                            TextSpan(text: 'tax: ${payModel.tax.toStringAsFixed(3)}')
                          ]
                      ),
                    ),
                  )
              )
            ],
          ),
        );
      },
    );
  }
}