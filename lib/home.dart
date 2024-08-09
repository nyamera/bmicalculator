import 'package:flutter/material.dart';
import 'package:bmicalculator/dashboard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 61, 109),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'BMI CALCULATOR',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/bmi.jpg'),
            ),
            TextButton.icon(
              icon: Icon(
                Icons.touch_app_rounded,
                color: Color.fromARGB(255, 235, 230, 227),
              ),
              label: Text(
                'Tap here to see the dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  backgroundColor: Color.fromARGB(255, 60, 131, 189),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
