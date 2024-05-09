import 'package:flutter/material.dart';
import 'package:bmi_calculator/ageweightcard.dart';
import 'package:bmi_calculator/genderButton.dart';
import 'package:bmi_calculator/ResultScreen.dart';
import 'package:bmi_calculator/bmi_model.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  double _currentHeight = 170.0;
  int _currentWeight = 70;
  int _currentAge = 30;
  String _selectedGender = 'Male'; // Default gender

  // Method to handle gender selection
  void _selectGender(String gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  // Method to handle BMI calculation
  void _calculateBMI() {
    BMIData bmiData = BMIData();
    double bmi = bmiData.calculateBMI(_currentWeight.toDouble(), _currentHeight);

    // Navigate to the ResultScreen with calculated BMI
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultScreen(bmi)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 40.0,
        backgroundColor: Colors.grey,
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 90),
                GenderButton(
                  genderText: 'Male',
                  genderIcon: Icons.male,
                  isSelected: _selectedGender == 'Male',
                  onTap: () => _selectGender('Male'),
                ),
                const SizedBox(width: 10),
                GenderButton(
                  genderText: 'Female',
                  genderIcon: Icons.female,
                  isSelected: _selectedGender == 'Female',
                  onTap: () => _selectGender('Female'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 10,
            color: Colors.black,
            child: SizedBox(
              width: 350,
              height: 150,
              child: Column(
                children: [
                  const Text(
                    'Height',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${_currentHeight.toStringAsFixed(1)} cm',
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Slider(
                    thumbColor: Colors.yellow,
                    activeColor: Colors.white,
                    value: _currentHeight,
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double value) {
                      setState(() {
                        _currentHeight = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AgeWeightCard(
                textLabel: 'Weight',
                value: _currentWeight,
              ),
              const SizedBox(width: 10),
              AgeWeightCard(
                textLabel: 'Age',
                value: _currentAge,

              ),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _calculateBMI,
            child: const Text(
              'Calculate your BMI',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
