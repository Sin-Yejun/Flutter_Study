import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';

import 'controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String lampIamge;

  @override
  void initState() {
    super.initState();
    lampIamge = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Controller();
                      },
                    ),
                  ).then((value) => getData());
                },
                icon: const Icon(Icons.edit)),
          )
        ],
      ),
      body: Center(
        child: Image.asset(
          lampIamge,
          width: 150,
        ),
      ),
    );
  }

  // --- Fcuntions ---
  getData() {
    if (Mesaage.lampon) {
      lampIamge = 'images/lamp_on.png';
      if (Mesaage.lampred) {
        lampIamge = 'images/lamp_red.png';
      }
    } else {
      lampIamge = 'images/lamp_off.png';
    }
    setState(() {});
  }
} // End
