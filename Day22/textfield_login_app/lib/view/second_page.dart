import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String id;
  const SecondPage({super.key, required this.id});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('${widget.id}님 환영합니다.'),
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(
            'images/bitcoin.jpg',
          ),
          radius: 100,
        ),
      ),
    );
  }
}
