import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple.shade200,
      child: Column(
        children: [
          const SizedBox(
            height: 130,
          ),
          const Text(
            'Shop Anytime, Anywhere',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Lottie.asset(
            'assets/animations/Animation2.json',
          )
        ],
      ),
    );
  }
}
