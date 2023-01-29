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
  bool _isNumberOfHoursValid = true;
  bool _ishourlyRateValid = true;
  Color get _isNumberOfHoursTextFieldBorderColor {
    return _isNumberOfHoursValid ? Colors.grey : Colors.red;
  }
  Color get _hourlyRateTextFieldBorderColor {
    return _ishourlyRateValid ? Colors.grey : Colors.red;
  }

  @override
  void dispose() {
    _numberOfHoursController.dispose();
    _hourlyRateController.dispose();
    super.dispose();
  }

  bool _validateNumberOfHours(String numberOfHours) {
    return int.tryParse(numberOfHours) != null;
  }

  bool _validateHourlyRate(String hourlyRate) {
    return double.tryParse(hourlyRate) != null;
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
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: _isNumberOfHoursTextFieldBorderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: _isNumberOfHoursTextFieldBorderColor,
                        ),
                      ),
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
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: _hourlyRateTextFieldBorderColor
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: _hourlyRateTextFieldBorderColor
                        )
                      ),
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
                      setState(() {
                        _isNumberOfHoursValid = _validateNumberOfHours(_numberOfHoursController.text);
                      });
                      setState(() {
                        _ishourlyRateValid = _validateHourlyRate(_hourlyRateController.text);
                      });
                      if (!_isNumberOfHoursValid || !_ishourlyRateValid) {
                        return;
                      }
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
                            TextSpan(text: 'tax: ${payModel.tax.toStringAsFixed(2)}')
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