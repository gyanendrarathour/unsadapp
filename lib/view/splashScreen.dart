import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '#233',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Target: 555'),
          const SizedBox(
            height: 15,
          ),
          Image.network(
              'https://static.langimg.com/thumb/msid-79623655,width-540,resizemode-3/79623655.jpg'),
        ],
      )),
    );
  }
}
