import 'package:flutter/material.dart';

class AgeWeightCard extends StatefulWidget {
  const AgeWeightCard({required this.textLabel, required this.value, Key? key})
      : super(key: key);

  final String textLabel;
  final int value;

  @override
  _AgeWeightState createState() => _AgeWeightState();
}

class _AgeWeightState extends State<AgeWeightCard> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  void increment() {
    setState(() {
      _value++;
    });
  }

  void decrement() {
    if (_value > 0) {
      setState(() {
        _value--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 10,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Text(
              widget.textLabel,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              '$_value',
              style: const TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: const CircleBorder(eccentricity: 0.0),
                  ),
                  onPressed: decrement,
                  child: const Text('-',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    shape: const CircleBorder(eccentricity: 0.0),
                  ),
                  onPressed: increment,
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
