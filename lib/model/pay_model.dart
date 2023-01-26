import 'package:flutter/material.dart';

class PayModel extends ChangeNotifier {
  int _numberOfHours = 0;
  double _hourlyRate = 0.0;

  PayModel();

  void setInfo(numberOfHours, hourlyRate) {
    _numberOfHours = numberOfHours;
    _hourlyRate = hourlyRate;
    notifyListeners();
  }

  double get regularPay {
    if (_numberOfHours <= 40) {
      return _numberOfHours * _hourlyRate;
    }
    else {
      return 40.0 * _hourlyRate;
    }
  }

  double get overtimePay {
    if (_numberOfHours > 40) {
      return (_numberOfHours - 40) * _hourlyRate * 1.5;
    }
    else {
      return 0.0;
    }
  }

  double get totalPay {
    return regularPay + overtimePay;
  }

  double get tax {
    return totalPay * 0.18;
  }
}