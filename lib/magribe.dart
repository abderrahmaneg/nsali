import 'package:flutter/material.dart';
class MagribePage extends StatelessWidget {
  const MagribePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Magribe')),
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
                'Description ',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
