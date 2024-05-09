import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_model.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen(this.bmi, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String bmiResult;
    bmiResult  = BMIData().interpretBMI(bmi);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 40.0,
        backgroundColor: Colors.grey,
        title: const Text(
          'Result',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your BMI: ${bmi.toStringAsFixed(1)} \nYou are $bmiResult',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            // Add any additional widgets or information about the BMI here
          ],
        ),
      ),
    );
  }
}
