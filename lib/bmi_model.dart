class BMIData {
  double calculateBMI(double weightKg, double heightCm) {
    double heightM = heightCm / 100.0;
    double bmi = weightKg / (heightM * heightM);
    return bmi;
  }

  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }


  double adjustBMIGender(double bmi, String gender) {
    if (gender.toLowerCase() == 'female') {
      return bmi;
    }
    return bmi;
  }
}
