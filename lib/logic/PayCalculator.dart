class PayCalculator {
  int numberOfHours;
  double hourlyRate;

  PayCalculator(this.numberOfHours, this.hourlyRate);

  double get regularPay {
    if (numberOfHours <= 40) {
      return numberOfHours * hourlyRate;
    }
    else {
      return 40.0 * hourlyRate;
    }
  }

  double get overtimePay {
    if (numberOfHours > 40) {
      return (numberOfHours - 40) * hourlyRate * 1.5;
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