import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List imageName;
  late int currentImage;

  @override
  void initState() {
    super.initState();
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentImage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Swiping'),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: SimpleGestureDetector(
        onHorizontalSwipe: (direction) => _onHorizontalSwipe(direction),
        onVerticalSwipe: (direction) => _onVerticalSwipe(direction),
        onDoubleTap: () => _onDoubleTapSwipe(),
        onTap: () => _onTapSwipe(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(imageName[currentImage]),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 350,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions ----
  _onHorizontalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.left) {
      // <--o 이렇게 스와이프
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    } else {
      // o--> 이렇게 스와이프
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    }
    setState(() {});
  }

  _onVerticalSwipe(SwipeDirection direction) {
    if (direction == SwipeDirection.up) {
      // <--o 이렇게 스와이프
      currentImage += 1;
      if (currentImage >= imageName.length) {
        currentImage = 0;
      }
    } else {
      // o--> 이렇게 스와이프
      currentImage -= 1;
      if (currentImage < 0) {
        currentImage = imageName.length - 1;
      }
    }
    setState(() {});
  }

  _onDoubleTapSwipe() {
    currentImage++;
    if (currentImage >= imageName.length) {
      currentImage = 0;
    }
    setState(() {});
  }

  _onTapSwipe() {
    currentImage -= 1;
    if (currentImage < 0) {
      currentImage = imageName.length - 1;
    }
    setState(() {});
  }
} // End
