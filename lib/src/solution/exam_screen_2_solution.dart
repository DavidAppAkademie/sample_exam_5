import 'dart:math';

import 'package:flutter/material.dart';

class ExamScreen2Solution extends StatefulWidget {
  const ExamScreen2Solution({super.key});

  @override
  State<ExamScreen2Solution> createState() => _ExamScreen2SolutionState();
}

class _ExamScreen2SolutionState extends State<ExamScreen2Solution> {
  int? _temperature;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futures - Async Await'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              children: [
                FilledButton(
                  onPressed: () async {
                    String city = await _getUserCity();
                    int temp = await _getCurrentTemp(city);
                    setState(() {
                      _temperature = temp;
                    });
                  },
                  child: Text('Temperatur abrufen'),
                ),
                SizedBox(height: 16),
                Text(
                  'Temperatur: ${_temperature ?? '---'}°C',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Simulates a weather API call
  /// after 1 second the current temperature of the city is returned
  /// the temperature is between 10 and 30
  Future<int> _getCurrentTemp(String city) async {
    await Future.delayed(Duration(seconds: 1));
    return Random().nextInt(20) + 10;
  }

  /// Simulates a user API call
  /// after 1 second the city of the user is returned
  Future<String> _getUserCity() async {
    await Future.delayed(Duration(seconds: 1));
    int random = Random().nextInt(2);
    if (random == 0) {
      return 'Berlin';
    } else {
      return 'München';
    }
  }
}
