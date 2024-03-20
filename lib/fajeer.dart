import 'package:flutter/material.dart';

class FajeerPage extends StatelessWidget {
  const FajeerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fajeer')),
      body: GestureDetector(
        onLongPress: () {
          Navigator.pushNamed(context, '/second');
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/asr.png'),
              const SizedBox(height: 20),
              const Text(
                'What is the Fajr? Fajr is one of five daily prayers',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
