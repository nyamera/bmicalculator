import 'package:flutter/material.dart';
import 'package:bmicalculator/passdata.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double weight = 0; //initiallizes weight
  double height = 0; //initializes height
  double bmiValue = 0; //initiallizes bmi value
  String bmiResult = ''; //initiallizes bmi result
  Color resultBackgroundColor =
      Color.fromARGB(255, 38, 97, 145); //initiallizes result colour
  String comment = '';
  TextEditingController textFieldController = TextEditingController();

  void calculateBMI() {
    //method to calculate bmi
    setState(() {
      bmiValue = (weight) / ((height * 0.01) * (height * 0.01));
      bmiResult = ' ${bmiValue.toStringAsFixed(2)}';

      if (bmiValue < 18) {
        resultBackgroundColor = Colors.blue;
        comment = 'Underweight';
      } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
        resultBackgroundColor = Colors.yellow;
        comment = 'Healthy weight';
      } else if (bmiValue >= 25 && bmiValue <= 29.9) {
        resultBackgroundColor = Color.fromARGB(255, 160, 73, 15);
        comment = 'Overweight';
      } else if (bmiValue >= 30) {
        resultBackgroundColor = Color.fromARGB(255, 231, 6, 6);
        comment = 'Obesity';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: resultBackgroundColor,
      appBar: AppBar(
        title: Text('BMI Calculator'), //tittle of the widget
        centerTitle: true, //put tittle at the center
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'WEIGHT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Slider(
                    value: weight,
                    max: 200.00,
                    divisions: 200,
                    label: weight.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        weight = value;
                      });
                    },
                  ),
                  Text(
                    '$weight KG',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  Slider(
                    value: height,
                    max: 250.00,
                    divisions: 250,
                    label: height.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                  Text(
                    '$height CM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    calculateBMI();
                    FocusScope.of(context).unfocus();
                  });
                },
              ),
              TextButton(
                child: Text(
                  'RESET',
                  style: TextStyle(
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    bmiValue = 0;
                    height = 0;
                    weight = 0;
                    bmiResult = "";
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          if (bmiResult.isNotEmpty)
            Card(
              color: resultBackgroundColor,
              margin: EdgeInsets.all(20),
              child: Text(
                'Your BMI value is ${bmiValue.toStringAsFixed(2)}      $comment',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
              ),
            ),
        ],
      ),
    );
  }
}
