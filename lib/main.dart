import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'doher.dart';
import 'aser.dart';
import 'fajeer.dart';
import 'ichae.dart';
import 'magribe.dart';
import 'sobah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: const First(),
    );
  }
}

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.repeat(reverse: true);

    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SecondScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Image.asset("assets/asr.png"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<bool> _textVisibilityList = [];
  List<String> _imageTexts = [
    '2 raka’at',
    '2 raka’at',
    '4 raka’at',
    '4 raka’at',
    '3 raka’at',
    '4 raka’at',
  ];

  List<Widget Function(BuildContext)> _pageRoutes = [
    (context) => const FajeerPage(),
    (context) => const SobahPage(),
    (context) => const DoherPage(),
    (context) => const AserPage(),
    (context) => const MagribePage(),
    (context) => const IchaePage(),
      
  ];

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _textVisibilityList = List.generate(_imageTexts.length, (index) => false);
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/asr.png',
      'assets/asr.png',
      'assets/asr.png',
      'assets/asr.png',
      'assets/asr.png',
      'assets/asr.png',
    ];
    int columnsCount = 2;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text("Prieres"),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: columnsCount,
          children: List.generate(imagePaths.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _textVisibilityList[index] = !_textVisibilityList[index];
                });
              },
              onLongPress: () {
                Navigator.push(context, MaterialPageRoute(builder: _pageRoutes[index]));
                 
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                    Visibility(
                      visible: _textVisibilityList[index],
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          _imageTexts[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  
}
