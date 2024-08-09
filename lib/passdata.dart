import 'package:flutter/material.dart';

class Passdata extends StatefulWidget {
  double weightValue;
  double heightValue;
  String BMIresult;
  Passdata(
      {required this.weightValue,
      required this.heightValue,
      required this.BMIresult});

  @override
  State<Passdata> createState() => _PassdataState();
}

class _PassdataState extends State<Passdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider capture'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Weight: ${widget.weightValue}'),
            Text('Height: ${widget.heightValue}'),
            Text('Your BMI value is ${widget.BMIresult}')
          ],
        ),
      ),
    );
  }
}
